{% extends "layouts/main.volt" %}

{% block content %}

	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<!-- https://api.hearthstonejson.com/v1/25770/ruRU/cards.json
	https://art.hearthstonejson.com/v1/render/latest/frFR/512x/EX1_001.png -->
	<h2>Пиздатая база карт по ХС</h2>
	<article>
		<div id="app">
			<select v-model="lang" >
				<option value="ruRU">Русский</option>
				<option value="enUS">English</option>
				<option value="deDE">Немецкий</option>
				<option value="esES">Испанский</option>
				<option value="esMX">Мексиканский?</option>
				<option value="frFR">Французский</option>
				<option value="itIT">ИТАЛЬЯЯЯНО</option>
				<option value="jaJP">НРТООООООО</option>
				<option value="koKR">Корейский</option>
				<option value="plPL">Курwa</option>
				<option value="ptBR">ptBR</option>
				<option value="thTH">thTH</option>
				<option value="zhCN">zhCN</option>
				<option value="zhTW">zhTW</option>
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
				currentCard: false
			},
			methods:
			{
				getText(argument)
				{
					console.log(this.currentCard);
					var index = this.findWithAttr('name', argument);
					if (index == -1)
						{
							this.currentCard = false;
							return false;
						}
					this.currentCard = this.infoOpt[argument[0]][index];
					return true;
				},
				//неправильно, работает только с именами
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
					this.infoOpt = [];
					for(let element of this.info)
					{
						if(element.id == 'PlaceholderCard')
							continue;
						if (typeof this.infoOpt[element['name'][0]] == 'undefined')
							this.infoOpt[element['name'][0]] = [];
						this.infoOpt[element['name'][0]].push(element);
					}
				    console.log(this.infoOpt);
				},
				changeLang(){
					if (this.currentCard!=false)
					{
						var cardId = this.currentCard.id;
						this.getCardBase();
						this.message = this.infoOptthis.findWithAttr('id', cardId);


					}
				},
				getCardBase(){
					axios
						.get('https://api.hearthstonejson.com/v1/25770/'+this.lang+'/cards.json')
						.then(response => {this.info = response.data; this.optimizeArray();});
				}
			},
			mounted () {
				this.getCardBase();
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