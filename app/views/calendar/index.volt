{% extends "layouts/main.volt" %}

{% block content %}
	<article>
		{{date}}
	</article>
	{% for day, comment in days %}
	    
	    <span>{{day+1}} </span>
	    <input type="text" name="comment" onchange="saveDay({{year}},{{month}},{{day+1}},value)" value='{{comment}}'>
	    <br>
	{% endfor %}


	<script type="text/javascript">
	function saveDay(year,month,day,comment)
	{
		$.ajax({
			url: "/calendar/saveDay/"+year+"/"+month+"/"+day+"/"+comment+"/",
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