<span class="col-sm text-right pr-5">
	{% if authUser == null %}
		<a class="logo" href="/auth/login/"> Login</a>
	{% else %}
		<a class="userHeader" 	href="/" >{{authUser.username}}</a>
		<a class="logoutHeader" href="/auth/logout/" >x</a>
	{% endif %}
</span>
