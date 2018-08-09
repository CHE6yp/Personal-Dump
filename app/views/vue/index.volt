{% extends "layouts/main.volt" %}

{% block content %}

	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<article>
		<div id="app">
			<p>${ message }</p>
			<input type="text" name="mes" v-model="message">
		</div>
	</article>

	<script type="text/javascript">
		var app = new Vue({
			delimiters: ['${', '}'],
			el: '#app',
			data: {
				message: 'Hello Vue!'
			}
		});
	</script>
{% endblock %}