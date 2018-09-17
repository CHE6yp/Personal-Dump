{% extends "layouts/main.volt" %}

{% block content %}
	<h2>{{text.title}}</h2>
	<form action="/text/save/{{text.id}}" method="POST" enctype="multipart/form-data">
		<input type="text" name="title" value="{{text.title}}"><br>
		<textarea name="text" style="width:1000px; height:800px;">{{text.text}}</textarea><br>
		<input type="submit" name="submit">
	</form>
{% endblock %}