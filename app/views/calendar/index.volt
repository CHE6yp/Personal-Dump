{% extends "layouts/main.volt" %}

{% block content %}
	<article>
	{% set prev = (month == 1) ? (year-1)~"/12/" : (year)~"/"~(month-1)~"/" %}
	{% set next = (month == 12) ? (year+1)~"/1/" : (year)~"/"~(month+1)~"/" %}

	<a href="/calendar/{{prev}}"><</a> {{year}} {{month}} <a href="/calendar/{{next}}">></a>
	</article>
	<div class="container">
		<div class="row">
		{% for day, comment in days %}
			<div class="col-sm" style="margin:3px ">
			    <span style="font-weight:bold; color:#aa2;">{{day+1}} </span><br>
			    <input  type="text" name="comment" onchange="saveDay({{year}},{{month}},{{day+1}},value)" value='{{comment}}'>
		    </div>

		{% endfor %}
	  
	    
	  	</div>
	</div>
	


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