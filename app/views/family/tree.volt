{% extends "layouts/main.volt" %}

{% block content %}
	<h2>Tree</h2>
	<p id='jsonTree'>{{people}}</p>
	<div id="myDiagramDiv" style="border: solid 1px black; width:100%; height:600px"></div>
	
	<script src="https://gojs.net/latest/release/go.js"></script>
	<script src="/public/js/genogram.js"></script>
{% endblock %}
