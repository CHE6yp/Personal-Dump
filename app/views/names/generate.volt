{% extends "layouts/namegen.volt" %}

{% block content %}

	<article>Из предоставленных имен мы сгенерировали вот это: <b>{{generatedName}}</b>. Ура?</article>
	<form action="" method='post'>
		<textarea name="names" hidden>{{text}}</textarea>
		<button>Давай по новой</button>
	</form>
	<a href="/names">Сменить имена</a>

	<br><br><br>
	<table style="border-collapse: collapse;">
		<tr>
			<th>\</th>
			<th>а</th>
			<th>б</th>
			<th>в</th>
			<th>г</th>
			<th>д</th>
			<th>е</th>
			<th>ё</th>
			<th>ж</th>
			<th>з</th>
			<th>и</th>
			<th>й</th>
			<th>к</th>
			<th>л</th>
			<th>м</th>
			<th>н</th>
			<th>о</th>
			<th>п</th>
			<th>р</th>
			<th>с</th>
			<th>т</th>
			<th>у</th>
			<th>ф</th>
			<th>х</th>
			<th>ц</th>
			<th>ч</th>
			<th>ш</th>
			<th>щ</th>
			<th>ъ</th>
			<th>ы</th>
			<th>ь</th>
			<th>э</th>
			<th>ю</th>
			<th>я</th>
			<th>end</th>
		</tr>
		{% for from, col in countArray %}
		<tr>
			<td style="border: 1px solid black; width: 2.5%; ">{{from}}</td>
		    {% for to, row in col %}

		        <td style="border: 1px solid black; width: 2.5%;{{(row>0)? 'color:blue; font-weight: bold; background-color:#d0f2d7;':''}}"> {{row}} </td>
		    {% endfor %}
		</tr>
		{% endfor %}
	</table>

{% endblock %}