{% extends "layouts/main.volt" %}

{% block content %}
	<article>
		<br>
		<a href="/video">Назад</a>
		<h2>{{video}}</h2>
		<div  >
			<video width="500"  controls>
				<source src="/Video/{{video}}" type="video/mp4">
			Your browser does not support the audio element.
			</video>
		</div>

	</article>

{% endblock %}