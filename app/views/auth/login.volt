{% extends "layouts/main.volt" %}

{% block content %}
<!-- <form action="/auth/signin/" method="POST">
	<label>Login</label>
	<input type="text" name="username">
	<label>Password</label>
	<input type="password" name="password">
	<button>Go</button>
</form> -->
<form action="/auth/signin/" method="POST" class="container h-100 w-50 pl-5 pr-5">
  <div class="form-group">
    <label for="login">Login</label>
    <input type="text" name="username" class="form-control" id="login" placeholder="Enter login">
  </div>
  <div class="form-group">
    <label for="password">Password</label>
    <input type="password" name="password" class="form-control" id="password" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Go</button>
</form>
{% endblock %}