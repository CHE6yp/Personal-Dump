{% extends "layouts/main.volt" %}

{% block content %}

	<h2>Подробно</h2>
	{% include "family/inc/person.volt" %}


	<h2>Родители</h2>
	{% if father %}
		{% set person = father %}
		{% include "family/inc/person.volt" %}
	{% endif %}

	{% if mother %}
		{% set person = mother %}
		{% include "family/inc/person.volt" %}
	{% endif %}

	<br>
	<h2>Дети</h2>

	{% for children in childrenByParents %}
		{% if children.parent %}
			{% set person = children.parent %}
			{% include "family/inc/person.volt" %}
		{% endif %}	
		<br>
		<div style="background-color: #90ff23;">
			{% for key,person in children %}
				{% if key !== 'parent' %}
					{% include "family/inc/person.volt" %}
				{% endif %}
			{% endfor %}
		</div>
		<br>
	{% endfor %}

	<br><br>
	<form class="add-track" method="POST" action="/family/addPerson">
		<label>Добавить человека</label><br>
		<input type="text" name="name"><label>Имя</label><br>
		<input type="text" name="surname"><label>Фамилия</label><br>
		<input type="text" name="nickname"><label>Кличка</label><br>
		<select name="gender">
			<option value="0">Пол</option>
			<option value="m">Мужчина</option>
			<option value="f">Женщина</option>
		</select>
		<br>
		<br>


		<input type="date" name="birthdate"><label>Дата рождения</label><br>
		<input type="date" name="deathdate"><label>Дата смерти</label><br>
		<br>


		<select name="father">
			<option value="0">Отец</option>
			{% for male in males %}
				<option value="{{male.id}}">{{male.name}} {{male.surname}}</option>
			{% endfor %}
		</select>
		<select name="mother">
			<option value="0">Мать</option>
			{% for female in females %}
				<option value="{{female.id}}">{{female.name}} {{female.surname}}</option>
			{% endfor %}
		</select>


		<br>
		<button type="submit">Add</button>
	</form>
{% endblock %}
