{% extends "layouts/main.volt" %}

{% block content %}
	<div  style="width:800px; margin:0 auto;">
		<h2>{{text.title}}</h2>
		
		<textarea readonly style="border: none;width:1000px; height:800px;">{{text.text}}</textarea><br>
		<a href="/text/edit/{{text.id}}">Редактировать</a>
	</div>
{% endblock %}