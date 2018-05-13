{% extends "layouts/main.volt" %}

{% block content %}
	<article>
		<h2>{{track.name}}</h2>
		<audio controls>
			<source src="/Audio/{{track.id}}.mp3" type="audio/mp3">
		Your browser does not support the audio element.
		</audio>
	</article>

{% endblock %}