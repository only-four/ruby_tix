var button = document.getElementById("btn");
var input = document.getElementById("mapsearch");
var placeholder = document.getElementById("map-canvas");

function initMao() {
  var map = new google.maps.Map(placeholder, {
    center: {
      lat: 25.0423384,
      lng: 121.5123999,
    },
    zoom: 11,
    minZoom: 10,
    maxZoom: 15,
    scrollwheel: false,
    mapTypeId: google.mpas.MapTypeId.ROADMAP,
  });
  // autocomplete
  var autocomplete = new google.maps.Autocomplete(input);

  // bound with map region
  autocomplete.binTo("bounds", map);
  autocomplete.setOptions({ strictBounds: true });
}
