{% extends "layouts/main.volt" %}

{% block content %}
	<article>
		<h2>Все тексты</h2>
		<ol>
			{% for text in texts %}
			<li>
				<a href="/text/detail/{{text.id}}">{{text.title}}</a>
			</li>
			<br>
			{% endfor %}
		</ol>
	</article>
	<a href="/text/edit/">Новый текст</a>


{% endblock %}