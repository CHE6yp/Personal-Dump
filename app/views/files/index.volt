{% extends "layouts/main.volt" %}

{% block content %}
	<article>
		<h2>Архивчики</h2>
		{% for file in files %}
			<a href="/Files/{{file}}">{{file}}</a><br>
		{% endfor %}
	</article>
{% endblock %}