{% extends "layouts/main.volt" %}

{% block content %}

	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<article>
		<div id="app">
			<p>${ message }<span v-if="message == 'help'">: ПШЕЛ ТЫ НННАХЕР, КЗЬЕЛ!</span></p>
			<input type="text" name="mes" v-model="message">
		</div>
	</article>

	<script type="text/javascript">
		var app = new Vue({
			delimiters: ['${', '}'],
			el: '#app',
			data: {
				message: 'Hello Vue!'
			}
		});
	</script>
=====================================
<div id="app-7">
  <ol>
    <!--
      Now we provide each todo-item with the todo object
      it's representing, so that its content can be dynamic.
      We also need to provide each component with a "key",
      which will be explained later.
    -->
    <todo-item
      v-for="item in groceryList"
      v-bind:todo="item"
      v-bind:key="item.id">
    </todo-item>
  </ol>
</div>

<script type="text/javascript">
	Vue.component('todo-item', {
	  props: ['todo'],
	  template: '<li> ${ todo.text } </li>'
	})

	var app7 = new Vue({
	  delimiters: ['${', '}'],
	  el: '#app-7',
	  data: {
	    groceryList: [
	      { id: 0, text: 'Vegetables' },
	      { id: 1, text: 'Cheese' },
	      { id: 2, text: 'Whatever else humans are supposed to eat' }
	    ]
	  }
	});
</script>




{% endblock %}