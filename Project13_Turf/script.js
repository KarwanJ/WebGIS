// Initialize the Leaflet map
const map = L.map('map', {
  center: [35.7, 51.4], // Set initial center to Tehran coordinates
  zoom: 11, // Set initial zoom level
});

// Add OpenStreetMap base layer
const baseLayer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: '© OpenStreetMap contributors' // Attribution for OpenStreetMap
}).addTo(map);

// Add WMS layer for laptop shops
const laptopWMSLayer = L.tileLayer.wms('http://localhost:8080/geoserver/WEBGIS_Project7/wms', {
  layers: 'WEBGIS_Project7:TehranLaptopShops', // Specify WMS layer
  format: 'image/png',
  transparent: true,
  version: '1.1.0'
}).addTo(map);

// Control visibility of the laptop WMS layer
document.getElementById('toggle-laptop').addEventListener('change', function () {
  if (this.checked) {
    map.addLayer(laptopWMSLayer); // Show WMS layer if checkbox is checked
  } else {
    map.removeLayer(laptopWMSLayer); // Hide WMS layer if checkbox is unchecked
  }
});

// Create a FeatureGroup for drawn shapes
const drawnItems = new L.FeatureGroup();
map.addLayer(drawnItems); // Add drawn items layer to the map

// Configure Leaflet Draw control
const drawControl = new L.Control.Draw({
  edit: {
    featureGroup: drawnItems, // Allow editing of drawn items
    remove: true // Enable removal of drawn shapes
  },
  draw: {
    polygon: true, // Enable polygon drawing
    polyline: true, // Enable polyline drawing
    rectangle: true, // Enable rectangle drawing
    circle: true, // Enable circle drawing
    marker: true, // Enable marker drawing
    circlemarker: false // Disable circle marker drawing
  }
});
map.addControl(drawControl); // Add draw control to the map

// Handle creation of drawn shapes
map.on(L.Draw.Event.CREATED, function (event) {
  const layer = event.layer;
  drawnItems.addLayer(layer); // Add newly drawn layer to FeatureGroup
});

// Handle feature identification on map click
document.getElementById('identify-btn').addEventListener('click', () => {
  alert("Click on the map to display point information.");

  map.once('click', function (e) {
    const point = map.latLngToContainerPoint(e.latlng, map.getZoom()); // Convert click coordinates to container point
    const size = map.getSize(); // Get map dimensions

    const params = {
      request: 'GetFeatureInfo',
      service: 'WMS',
      srs: 'EPSG:4326',
      styles: '',
      transparent: true,
      version: '1.1.0',
      format: 'image/png',
      bbox: map.getBounds().toBBoxString(), // Get map bounds
      height: size.y,
      width: size.x,
      layers: laptopWMSLayer.wmsParams.layers,
      query_layers: laptopWMSLayer.wmsParams.layers,
      info_format: 'text/html',
      x: Math.round(point.x), // Click x-coordinate
      y: Math.round(point.y) // Click y-coordinate
    };

    const url = laptopWMSLayer._url + L.Util.getParamString(params, laptopWMSLayer._url, true); // Construct WMS GetFeatureInfo URL

    window.open(url, '_blank'); // Open feature info in a new tab
  });
});

// Handle map export as PNG (first event listener, likely redundant)
document.getElementById('export-png-btn').addEventListener('click', () => {
  leafletImage(map, function (err, canvas) {
    if (err) {
      alert('Error in exporting'); // Show error if export fails
      return;
    }
    const img = document.createElement('a');
    img.href = canvas.toDataURL(); // Create data URL for the canvas
    img.download = 'map.png'; // Set download filename
    img.click(); // Trigger download
  });
});

// Handle map export as PNG with progress bar
let exportInterval;
let exportCancelled = false;

document.getElementById('export-png-btn').addEventListener('click', () => {
  const container = document.getElementById('progress-container');
  const bar = document.getElementById('progress-bar');

  container.style.display = 'block'; // Show progress container
  bar.style.width = '0%'; // Reset progress bar

  let progress = 0;
  exportCancelled = false;

  exportInterval = setInterval(() => {
    if (exportCancelled) {
      clearInterval(exportInterval); // Stop interval if cancelled
      container.style.display = 'none';
      bar.style.width = '0%';
      return;
    }

    if (progress < 95) {
      progress += 1;
      bar.style.width = progress + '%'; // Update progress bar
    }
  }, 100);

  leafletImage(map, function (err, canvas) {
    clearInterval(exportInterval); // Clear progress interval

    if (exportCancelled) {
      container.style.display = 'none';
      bar.style.width = '0%';
      return;
    }

    bar.style.width = '100%'; // Complete progress bar

    setTimeout(() => {
      container.style.display = 'none'; // Hide progress container
      bar.style.width = '0%'; // Reset progress bar
    }, 600);

    if (err) {
      alert('Error in exporting'); // Show error if export fails
      return;
    }

    const img = document.createElement('a');
    img.href = canvas.toDataURL(); // Create data URL for the canvas
    img.download = 'map.png'; // Set download filename
    img.click(); // Trigger download
  });
});

// Handle cancel button for export
document.getElementById('cancel-btn').addEventListener('click', () => {
  exportCancelled = true; // Set flag to cancel export
});

// Variables for spatial analysis layers
let pointsLayer, pointsData;
let hullLayer, centerLayer, bufferLayer, tinLayer;

// Fetch GeoJSON data for Tehran laptop shops
fetch('http://localhost:8080/geoserver/WEBGIS_Project7/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=WEBGIS_Project7:TehranLaptopShops&maxFeatures=200&outputFormat=application/json')
  .then(res => res.json())
  .then(geojson => {
    // 1. Display points on the map
    pointsLayer = L.geoJSON(geojson, {
      pointToLayer: (feature, latlng) => L.circleMarker(latlng, {
        radius: 5,
        color: '#b3124b',
        fillColor: '#b3124b',
        fillOpacity: 0.8
      })
    }).addTo(map);

    // 2. Prepare data for Turf.js analysis
    pointsData = turf.featureCollection(geojson.features);

    // 3. Control visibility of points layer
    document.getElementById('toggle-laptop2').addEventListener('change', function () {
      if (this.checked) {
        map.addLayer(pointsLayer); // Show points layer if checkbox is checked
      } else {
        map.removeLayer(pointsLayer); // Hide points layer if checkbox is unchecked
      }
    });

    // 4. Button for Convex Hull analysis
    document.getElementById('btn-hull').addEventListener('click', () => {
      if (hullLayer) {
        map.removeLayer(hullLayer); // Remove existing hull layer
        hullLayer = null;
      } else {
        const hull = turf.convex(pointsData); // Calculate convex hull
        if (hull) {
          hullLayer = L.geoJSON(hull, {
            style: { color: 'red', weight: 2, fillOpacity: 0.1 }
          }).addTo(map); // Add hull layer to map
        }
      }
    });

    // 5. Button for geometric center of points
    document.getElementById('btn-center').addEventListener('click', () => {
      if (centerLayer) {
        map.removeLayer(centerLayer); // Remove existing center layer
        centerLayer = null;
      } else {
        const center = turf.center(pointsData); // Calculate center
        centerLayer = L.geoJSON(center, {
          pointToLayer: (feature, latlng) => L.circleMarker(latlng, {
            radius: 7,
            color: 'blue',
            fillColor: 'blue',
            fillOpacity: 0.7
          }).bindPopup('Center')
        }).addTo(map); // Add center layer to map
      }
    });

    // 6. Button for buffering points
    document.getElementById('btn-buffer').addEventListener('click', () => {
      if (bufferLayer) {
        map.removeLayer(bufferLayer); // Remove existing buffer layer
        bufferLayer = null;
      } else {
        const bufferedFeatures = pointsData.features.map(f => turf.buffer(f, 500, { units: 'meters' })); // Create 500m buffer for each point
        const bufferedCollection = turf.featureCollection(bufferedFeatures);
        bufferLayer = L.geoJSON(bufferedCollection, {
          style: { color: '#b3124b', weight: 1, fillOpacity: 0.2 }
        }).addTo(map); // Add buffer layer to map
      }
    });

    // 7. Button for Delaunay Triangulation (TIN) analysis
    document.getElementById('btn-tin').addEventListener('click', () => {
      if (!pointsData) return;

      if (tinLayer) {
        map.removeLayer(tinLayer); // Remove existing TIN layer
        tinLayer = null;
      } else {
        // Assign random z-value (0-9) to each point
        pointsData.features.forEach(f => {
          f.properties.z = Math.floor(Math.random() * 9);
        });

        const tin = turf.tin(pointsData, 'z'); // Calculate TIN
        tinLayer = L.geoJSON(tin, {
          style: {
            color: '#555',
            weight: 1,
            fillColor: '#ccc',
            fillOpacity: 0.3
          }
        }).addTo(map); // Add TIN layer to map
      }
    });
  });