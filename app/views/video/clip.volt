{% extends "layouts/main.volt" %}

{% block content %}
	<article>
		<br>
		<a href="/video">Назад</a>
		<h2>{{video}}</h2>
		<div  >
			<video id="videoClip" width="500"  controls>
				<source src="/Video/{{video}}" type="video/mp4">
			Your browser does not support the video element.
			</video>
		</div>

	</article>
	<script type="text/javascript" src="/js/video.js"></script>
{% endblock %}