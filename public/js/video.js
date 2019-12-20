var curVid;
$( document ).ready(function() {
	$('#videoClip').on('ended',function(e){
		console.log($('#replayBox'));
		if ($('#replayBox').is(':checked')){
			e.currentTarget.pause();
			e.currentTarget.currentTime = '0';
			e.currentTarget.play();
		}
	});
});