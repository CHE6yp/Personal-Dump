var curVid;
$( document ).ready(function() {
	$('#videoClip').on('ended',function(e){
		console.log(e);
		e.currentTarget.pause();
		e.currentTarget.currentTime = '0';
		e.currentTarget.play();
	});
});