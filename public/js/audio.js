$( document ).ready(function() {
	var tracks = $("audio");
	var currentTrack;
	$.each(tracks, function (key, value)
	{
		$(value).on("play",function (event) {

			event.preventDefault();
			// $.each($("audio"), function (key, track)
			// {
			// 	if (track != event.currentTarget)
			// 	{
			// 		track.pause();
			// 	}
			// })
			// console.log(currentTrack);
			// console.log(event.currentTarget);
			if (currentTrack!=undefined && currentTrack!=event.currentTarget)
			{
				currentTrack.pause();
				currentTrack.currentTime = 0;
			}
			currentTrack = event.currentTarget;
		})
	})

});