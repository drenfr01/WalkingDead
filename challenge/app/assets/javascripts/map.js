var map;
var service;
var infowindow;

//Note no calls from this function to any others to the website will render regardless of geo-location
function initialize() {
				
				//temporarily center at Boston
				var tempCoordinates = new google.maps.LatLng(42.37, -71.03);
				
				// Set up map
				var myOptions = {
					zoom: 15, // The larger the zoom number, the bigger the zoom
					center: tempCoordinates,
					mapTypeId: google.maps.MapTypeId.ROADMAP
				};
				
				// Create the map in the "map_canvas" <div>
				map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
}

function getGeoLocation()
{ 

//annoying test for IE, basically (or other browsers that don't support geolocation....yeah)
if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
		var userLat = position.coords.latitude;
		var userLng = position.coords.longitude;
		setUserPosition(userLat, userLng)
		});
		
	}
	else {
		alert("Warning, Geolocation not supported on your browser");
	}  
}
//Helper function for modularity
function setUserPosition(userLat, userLng)
{

	console.log(userLat,userLng);
	var userPosition = new google.maps.LatLng(userLat, userLng);
	
	// Create a marker				
	var marker = new google.maps.Marker({
					position: userPosition,
					title: "Your Current Position"
				});
	marker.setMap(map);
	map.setCenter(userPosition);				

	var infowindow = new google.maps.InfoWindow();
				
	// Open info window on click of marker
	google.maps.event.addListener(marker, 'click', function() {
					infowindow.close();
					infowindow.setContent(marker.title);
					infowindow.open(map, marker);
				});
}

function placeChallengeMarkers(latitude, longitude)
{
	
	console.log(latitude);
	console.log(longitude);
	console.log(map);
	var marker;
		
		newMarkerLatLng = new google.maps.LatLng(latitude, longitude); 
		marker = new google.maps.Marker({
					position: newMarkerLatLng,
				});

				
		marker.setMap(map);
		
		var infowindow = new google.maps.InfoWindow();
		
				// Open info window on click of marker, note the "this" to make sure each infowindow is mapped to appropriate marker
		google.maps.event.addListener(marker, 'click', function() {
					infowindow.close();
					infowindow.setContent("Name: ");
					infowindow.open(map, this);
				});
}
