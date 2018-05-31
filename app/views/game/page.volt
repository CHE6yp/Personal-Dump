{% extends "layouts/main.volt" %}

{% block content %}
	<a href="/game/page?id=1"><<-- Бля, давай заново!</a><br>
	<img src="/VN/Pics/{{page.id}}.png">
	<hr>
	<br>
	<article>{{page.text}}</article>
	<br>
	<hr>
	{% for option in page.options %}
		<br><a href="{{option.nextPage()}}">{{option.text}}</a>
	{% endfor %}

{% endblock %}