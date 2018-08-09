$( document ).ready(function() {
	var tracks = $("audio");
	var currentTrack;
	$.each(tracks, function (key, value)
	{
		$(value).on("play",function (event) {

			event.preventDefault();

			if (currentTrack!=undefined && currentTrack!=event.currentTarget)
			{
				currentTrack.pause();
				currentTrack.currentTime = 0;
			}
			currentTrack = event.currentTarget;
		})
	})

});