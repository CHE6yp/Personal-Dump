{% extends "layouts/main.volt" %}

{% block content %}
	{% for personLevel in newAll %}
		<div>
			{% for person in personLevel %}
				{% include "family/inc/person.volt" %}
			{% endfor %}
		</div>
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
