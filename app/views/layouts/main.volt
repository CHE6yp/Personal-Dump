<head>
	<title>{{title}}</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="/public/js/family.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/main.css">

</head>
<body>
	<header>
		<a class="logo" href="/" >Personal Dump</a><h1>{{h1}}</h1>

		{{ (authUser == null)? '<a style="position: absolute;right: 10px;top: 25px;" class="logo" href="/auth/login/">Login</a>': authUser.username }}
	</header>

<div class="content">
	{% block content %}
	{% endblock %}
</div>

</body>