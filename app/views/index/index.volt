{% extends "layouts/main.volt" %}

{% block content %}

	<article>
		{% if authUser %}
		Уау, ты залогинен.
		<h2>Это мой сайтецкий, я писал ему скриптецкий</h2>
		<p>Если хочешь зарубать в ВИЖУАЛ НОВЕЛ, тебе <a href="game">сюда</a>.</p>
		<p>Если хочешь генерировать имена с помощью <a href="https://ru.wikipedia.org/wiki/%D0%A6%D0%B5%D0%BF%D1%8C_%D0%9C%D0%B0%D1%80%D0%BA%D0%BE%D0%B2%D0%B0">Цепей Маркова</a>, тебе <a href="names/">СЮДА</a>.</p>
		<p>Послушать музон - <a href="/audio/">тут</a>.</p>
		<p>А видосы - <a href="/video/">тут</a>.</p>
		<p><a href="/vue/">Vue.js playground</a></p>
		<p><a href="/text/">texts</a></p>
		<p><a href="/files/">files</a></p>
		<p><a href="/calendar/">calendar</a></p>
		{% endif %}
		<p>Чето чето арвадалта <a href="family/tree/30">СЮДА</a>.</p>
	</article>

{% endblock %}