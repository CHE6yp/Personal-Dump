{% extends "layouts/main.volt" %}


{% block content %}

	<style>
		* {box-sizing: border-box;}
		ul {list-style-type: none;}
		body {font-family: Calibri light, Arial, Helvetica}
		.month {
		  padding: 50px 75px;
		  width: 100%;
		  background: #292b2c;
		  text-align: center;
		}
		.month ul {
		  margin: 0;
		  padding: 0;
		}
		.month ul li {
		  color: white;
		  font-size: 40px;
		  text-transform: uppercase;
		  letter-spacing: 6px;
		}
		.month .prev {
		  float: left;
		  padding-top: 20px;

		}
		.month .next {
		  float: right;
		  padding-top: 20px;
		}
		.weekdays {
		  margin: 0;
		  padding: 10px 0;
		  background-color: #1496E1;
		}
		.weekdays li {
		  display: inline-block;
		  width: 13.8%;
		  color: grey light;
		  text-align: center;
		  font-weight: bold;
		}
		.days {
		  padding: 10px 0;
		  background: #eee;
		  margin: 0;
		}

		.days li {
		  list-style-type: none;
		  display: inline-block;
		  width: 13.6%;
		  text-align: center;
		  margin-bottom: 5px;
		  font-size:12px;
		  color: #777;
		}
		.days li .active {
		  padding: 7px;
		  background: #C71585;
		  color: white;
		}
		@media screen and (max-width:720px) {
		  .weekdays li, .days li {width: 15.1%;}
		}
		@media screen and (max-width: 440px) {
		  .weekdays li, .days li {width: 15.5%;}
		  .days li .active {padding: 4px;}
		}
		@media screen and (max-width: 390px) {
		  .weekdays li, .days li {width: 12.2%;}
		}
	</style>

	{% set prev = (month == 1) ? (year-1)~"/12/" : (year)~"/"~(month-1)~"/" %}
	{% set next = (month == 12) ? (year+1)~"/1/" : (year)~"/"~(month+1)~"/" %}


	<span style="font-size:14px">Общее количество сигарет - <b>{{all}}</b></span><br>
	<span style="font-size:14px">Сигарет в среднем - <b>{{average}}</b></span>
	<div class="month">      
	  <ul>
	    <li class="prev"><a href="/calendar/{{prev}}">❮</a></li>
	    <li class="next"><a href="/calendar/{{next}}">❯</a></li>
	    <li>
	      	{{month}}<br>
	      	<span style="font-size:28px">{{year}}</span><br>
	    </li>
	  </ul>
	</div>
	<ul class="weekdays">
	  <li>Mo</li>
	  <li>Tu</li>
	  <li>We</li>
	  <li>Th</li>
	  <li>Fr</li>
	  <li>Sa</li>
	  <li>Su</li>
	</ul>
	<ul class="days">  
		{% for day, comment in days %}
			<li>

				    <span style="font-weight:bold; color:#aa2;">{{day+1}} </span><br>
				    <input type="text" name="comment" onchange="saveDay({{year}},{{month}},{{day+1}},value)" value='{{comment}}' 
				    {{(authUser)?'':'disabled'}}>

			</li>
		{% endfor %}

	</ul>


	<!--
	<article>
	<a href="/calendar/{{prev}}"><</a> {{year}} {{month}} <a href="/calendar/{{next}}">></a><br>
	<span>Общее количество сигарет - <b>{{all}}</b></span><br>
	<span>Сигарет в среднем - <b>{{average}}</b></span>
	</article>
	<div class="container">
		<div class="row">
		{% for day, comment in days %}
			<div class="col-sm" style="margin:3px ">
			    <span style="font-weight:bold; color:#aa2;">{{day+1}} </span><br>
			    <input  type="text" name="comment" onchange="saveDay({{year}},{{month}},{{day+1}},value)" value='{{comment}}' 
			    {{(authUser)?'':'disabled'}}>
		    </div>

		{% endfor %}
	  
	    
	  	</div>
	</div>
	-->


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