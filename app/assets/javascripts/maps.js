$(document).ready(function(){
	var map = $('#map');

	$.get(map.data('tool-url'), function(tool) {

		console.log(tool);

		var map =  new GMaps({
			div: '#map',
			lat: tool.latitude,
			lng: tool.longitude
		});

		map.addMarker({
  			lat: tool.latitude,
  			lng: tool.longitude,
  			title: tool.title
		});
	})
})


