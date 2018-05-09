{% extends "layouts/familyTree.volt" %}

{% block content %}
	{% for personLevel in newAll %}
		<div>
			{% for person in personLevel %}
				<div class="person" id="{{person.id}}" style="margin: 5px; margin-top:20px; padding: 3px; width:150px; border: 1px solid black; display: inline-block; {{ (person.id == startId)? "background-color: yellow;":""}}">
					<span>{{person.name}} {{person.surname}} </span>
					<br><span>{{person.level}}</span>


				</div>
			{% endfor %}
		</div>
	{% endfor %}
{% endblock %}
