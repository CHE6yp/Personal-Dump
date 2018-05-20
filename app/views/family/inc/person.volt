<div class="person" id="{{person.id}}" style="margin: 5px; margin-top:20px; padding: 3px; width:150px; border: 1px solid black; display: inline-block; background-color: white;">
	<img src="{{person.getPicture()}}" height="150" width="150">
	<span>{{person.name}} {{person.surname}} </span><br>
	<a href="/family/detail/{{person.id}}">Подробно</a>
</div>