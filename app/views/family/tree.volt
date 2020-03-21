{% extends "layouts/familyTree.volt" %}

{% block content %}
	<h2>Tree</h2>
	<!-- <p id='jsonTree'>{{people}}</p> -->

	<!-- The DIV for a Diagram needs an explicit size or else we will not see anything.
     In this case we also add a background color so we can see that area. -->
<div id="sample">
  <div id="myDiagramDiv" style="background-color: #F8F8F8; border: solid 1px black; width:100%; height:600px;"></div>
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
  <p></p>
  <pre hidden id="peopleData">    {{people}}
  </pre>
</div>

	<script src="/public/js/genogram.js"></script>
	<script type="text/javascript">
		init();
		setupDiagram(myDiagram, JSON.parse( $('#peopleData').text()),1);
	</script>


{% endblock %}
