{% extends "layouts/main.volt" %}

{% block content %}
<form action="/auth/signin/" method="POST">
	<label>Login</label>
	<input type="text" name="username">
	<label>Password</label>
	<input type="password" name="password">
	<button>Go</button>
</form>
{% endblock %}