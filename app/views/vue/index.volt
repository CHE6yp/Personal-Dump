{% extends "layouts/main.volt" %}

{% block content %}

	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<!-- https://api.hearthstonejson.com/v1/25770/ruRU/cards.json
	https://art.hearthstonejson.com/v1/render/latest/frFR/512x/EX1_001.png -->
	<h2>Пиздатая база карт по ХС</h2>
	<article>
		<div id="app">
			<select v-model="lang">
				<option value="ruRU">Русский</option>
				<option value="enUS">English</option>
			</select>
			<p>Напиши например "Павший герой" или "Авиана"!</p>

			<input type="text" name="mes" v-model="message" placeholder="Суккуб">
			<div v-if="getText(message)"><h3>${ message }</h3> <p>${ currentCard.flavor }<p><img :src="getImage(currentCard.id) "></div>
		</div>
	</article>

	<script type="text/javascript">
		var app = new Vue({
			delimiters: ['${', '}'],
			el: '#app',
			data: {
				message: '',
				jsones: '',
				info: '',
				lang: 'ruRU',
				infoOpt: {},
				currentCard: ''
			},
			methods:
			{
				getText(argument)
				{
					var index = this.findWithAttr('name', argument);
					if (index == -1)
						return false;
					this.currentCard = this.infoOpt[argument[0]][index];
					return true;
				},
				findWithAttr(attr, value) {
					if (typeof this.infoOpt[value[0]] == 'undefined')
						return -1;
				    for(var i = 0; i < this.infoOpt[value[0]].length; i += 1) {
				        if(this.infoOpt[value[0]][i][attr] == value) {
				            return i;
				        }
				    }
				    return -1;
				},
				getImage(id) {
					return "https://art.hearthstonejson.com/v1/render/latest/"+this.lang+"/256x/"+ id +".png";
				},
				optimizeArray() {
					for(let element of this.info)
					{
						if(element.id == 'PlaceholderCard')
							continue;
						if (typeof this.infoOpt[element['name'][0]] == 'undefined')
							this.infoOpt[element['name'][0]] = [];
						this.infoOpt[element['name'][0]].push(element);
					}
					// for(var i = 0; i < this.info.length - 1; i ++) {
					// 	if(this.info[i].id == 'PlaceholderCard')
					// 		continue;
					// 	if (typeof this.infoOpt[this.info[i]['name'][0]] == 'undefined')
					// 		this.infoOpt[this.info[i]['name'][0]] = [];
					// 	this.infoOpt[this.info[i]['name'][0]].push(this.info[i]);
				 //    };
				    console.log(this.infoOpt);
				}
			},
			mounted () {
				axios
					.get('https://api.hearthstonejson.com/v1/25770/'+this.lang+'/cards.json')
					.then(response => {this.info = response.data; this.optimizeArray();});
			}
		});
	</script>


=====================================
<!--
<div id="app-7">
  <ol>
    <!--
      Now we provide each todo-item with the todo object
      it's representing, so that its content can be dynamic.
      We also need to provide each component with a "key",
      which will be explained later.
    --
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
	  template: '<li> \${ todo.text } </li>'
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
-->



{% endblock %}