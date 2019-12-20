{% extends "layouts/main.volt" %}

{% block content %}
	<article>
	{% set prev = (month == 1) ? (year-1)~"/12/" : (year)~"/"~(month-1)~"/" %}
	{% set next = (month == 12) ? (year+1)~"/1/" : (year)~"/"~(month+1)~"/" %}

	<a href="/calendar/{{prev}}"><</a> {{year}} {{month}} <a href="/calendar/{{next}}">></a>
	</article>
	{% for day, comment in days %}
	    
	    <span>{{day+1}} </span>
	    <input type="text" name="comment" onchange="saveDay({{year}},{{month}},{{day+1}},value)" value='{{comment}}'>
	    <br>
	{% endfor %}


	<script type="text/javascript">
	function saveDay(year, month, day, comment)
	{
		url = "/calendar/saveDay/"+year+"/"+month+"/"+day+"/"+comment+"/";
		console.log(url);
		$.ajax({
			url: url,
/*				beforeSend: function( xhr ) {
				xhr.overrideMimeType( "text/plain; charset=x-user-defined" );
			}*/	
		})
		.done(function( data ) {
			console.log('Saved');
		});
	}
	</script>
{% endblock %}