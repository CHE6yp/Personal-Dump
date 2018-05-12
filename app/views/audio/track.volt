{% extends "layouts/main.volt" %}

{% block content %}
	<h3>Аудио</h3>
	<article>Track</article>
	<audio controls>
		<source src="/Audio/Hardbone.mp3" type="audio/mp3">
	Your browser does not support the audio element.
	</audio>
	<br>
	<audio controls>
		<source src="/Audio/Hardbone 2.mp3" type="audio/mp3">
	Your browser does not support the audio element.
	</audio>

{% endblock %}