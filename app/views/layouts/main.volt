<head>
	<title>{{title}}</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="/public/js/family.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/main.css">
	<link href="https://fonts.googleapis.com/css?family=Pacifico" rel="stylesheet">

</head>
<body>
	<header>
		<a class="logo" href="/" >Personal Dump</a>
		<h1>{{h1}}</h1>
		{% include "layouts/inc/loginUserHeader.volt" %}
	</header>

<div class="content">
	{% block content %}
	{% endblock %}
</div>

</body>