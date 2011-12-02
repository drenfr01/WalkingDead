# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

geosuccess = (pos) ->
	lat = pos.coords.latitude
	lng = pos.coords.longitude
	console.log lat, lng

geofailure = (e) ->
	console.log e

if navigator.geolocation?
	navigator.geolocation.getCurrentPosition geosuccess, geofailure
