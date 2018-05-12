{% extends "layouts/main.volt" %}

{% block content %}
	<h2>Все треки</h2>
	<article>Четкий музонтий</article>
	<ol>
		{% for track in audioFiles %}
		<li>
			<span>{{track.name}}</span><br>
			<audio controls>
				<source src="/Audio/{{track.id}}.mp3" type="audio/mp3">
				Your browser does not support the audio element.
			</audio>
		</li>
		<br>
		{% endfor %}
	</ol>
	<form id="uploadSong" action="/audio/upload" method="POST" enctype="multipart/form-data">
		<h2>Загрузить трек</h2>
		<input type="text" name="name" required> - имя трека<br><br>
		<input type="file" name="file" id="fileToUpload" required><br><br>
		<input type="submit" name="submit">
	</form>


	<script type="text/javascript">
		// $("#uploadSong").submit(function(e) {
		// 		var url = "/audio/upload"; // the script where you handle the form input.

		// 		$.ajax({
		// 				type: "POST",
		// 				url: url,
		// 				data: $("#uploadSong").serialize(), // serializes the form's elements.
		// 				success: function(data)
		// 				{
		// 					alert(data); // show response from the php script.
		// 				}
		// 			});

		// 		e.preventDefault(); // avoid to execute the actual submit of the form.
		// 	});
	</script>

{% endblock %}