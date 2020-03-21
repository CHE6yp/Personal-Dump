{% extends "layouts/familyTree.volt" %}

{% block content %}
	<h2>Tree</h2>
	<!-- <p id='jsonTree'>{{people}}</p> -->

	<!-- The DIV for a Diagram needs an explicit size or else we will not see anything.
     In this case we also add a background color so we can see that area. -->
<div id="sample">
  <div id="myDiagramDiv" style="background-color: #F8F8F8; border: solid 1px black; width:100%; height:600px;"></div>
  <p>A <em>genogram</em> or <em>pedigree chart</em> is an extended family tree diagram that displays information about each person or each relationship.</p>
  <p>
    There are functions that convert an attribute value into a brush color or Shape geometry,
    to be added to the Node representing the person.
  </p>
  <p>
    A custom <a>LayeredDigraphLayout</a> does the layout, assuming there is a central person whose mother and father
    each have their own ancestors.  In this case we focus on "Bill", but any of the children of "Alice" and "Aaron" would work.
    The overridden <b>add</b> function allows husband/wife pairs to be represented by a single <a>LayeredDigraphVertex</a>.
  </p>
  <p>For a simpler family tree, see the <a href="familyTree.html">family tree sample</a>.</p>
  <p>
    The node data representing the people, processed by the <code>setupDiagram</code> function is below.
    The properties are:
    </p><ul>
      <li><b>key</b>, the unique ID of the person</li>
      <li><b>n</b>, the person's name</li>
      <li><b>s</b>, the person's sex</li>
      <li><b>m</b>, the person's mother's key</li>
      <li><b>f</b>, the person's father's key</li>
      <li><b>ux</b>, the person's wife</li>
      <li><b>vir</b>, the person's husband</li>
      <li><b>a</b>, an Array of the attributes or markers that the person has</li>
    </ul>
  <p></p>
  <pre id="peopleData">    {{people}}
  </pre>
</div>

	<script src="/public/js/genogram.js"></script>
	<script type="text/javascript">
		// setupDiagram(myDiagram, [
		//     { key: 1, n: "Ibragim", s: "m", m: 2,f: 3,ux: 2,a: ["C","F","K"]},
		//     { key: 2, n: "Bella", s: "f", m: 4,f: 5, vir: 3,a: ["C","F","K"]},
		//     { key: 3, n: "Ruslanbek", s: "m", m: 7,f: 6,ux: 2,a: ["C","F","K"]},
		//     { key: 4, n: "Tamara", s: "f", m: 19,f: 18, vir: 3,a: ["C","F","K"]},
		//     { key: 5, n: "Konstantin", s: "m",ux: 2,a: ["C","F","K"]},
		//     { key: 6, n: "Gabat", s: "m", m: 17,f: 16,ux: 2,a: ["C","F","K"]},
		//     { key: 7, n: "Anaida", s: "f", m: 15,f: 14, vir: 3,a: ["C","F","K"]},
		//     { key: 8, n: "Emma", s: "f", m: 4,f: 5, vir: 3,a: ["C","F","K"]},
		//     { key: 9, n: "Aslanbek", s: "m",ux: 2,a: ["C","F","K"]},
		//     { key: 10, n: "Zarema", s: "f", m: 8, vir: 3,a: ["C","F","K"]},
		//     { key: 11, n: "Marina", s: "f", m: 8,f: 9, vir: 3,a: ["C","F","K"]},
		//     { key: 12, n: "Zarina", s: "f", m: 8,f: 9, vir: 3,a: ["C","F","K"]},
		//     { key: 13, n: "Dzerassa", s: "f", m: 8,f: 9, vir: 3,a: ["C","F","K"]},
		//     { key: 14, n: "Aleksandr", s: "m",ux: 2,a: ["C","F","K"]},
		//     { key: 15, n: "Unknown", s: "f", vir: 3,a: ["C","F","K"]},
		//     { key: 16, n: "Suslanbek", s: "m",ux: 2,a: ["C","F","K"]},
		//     { key: 17, n: "Unknown", s: "f", vir: 3,a: ["C","F","K"]},
		//     { key: 18, n: "Ivan", s: "m", m: 21,f: 20,ux: 2,a: ["C","F","K"]},
		//     { key: 19, n: "Vera", s: "f", vir: 3,a: ["C","F","K"]},
		//     { key: 20, n: "Unknown", s: "m",ux: 2,a: ["C","F","K"]},
		//     { key: 21, n: "Gitsi", s: "f", vir: 3,a: ["C","F","K"]},
		//     { key: 22, n: "23", vir: 3,a: ["C","F","K"]}
		// ] ,
		// 0 );

		init();
		  // n: name, s: sex, m: mother, f: father, ux: wife, vir: husband, a: attributes/markers
		// setupDiagram(myDiagram, [
		// 		{ key: 1, n: "Ibragim", s: "M", m: 2,f: 3,a: ["C","F","K"]},
		// 		{ key: 2, n: "Bella", s: "F", m: 4,f: 5, a: ["C","F","K"], vir:3},
		// 		{ key: 3, n: "Ruslanbek", s: "M", m: 7,f: 6,a: ["C","F","K"], ux:2},
		// 		{ key: 4, n: "Tamara", s: "F", m: 19,f: 18, a: ["C","F","K"], vir:5},
		// 		{ key: 5, n: "Konstantin", s: "M",a: ["C","F","K"], ux:4},
		// 		{ key: 6, n: "Gabat", s: "M", m: 17,f: 16,a: ["C","F","K"]},
		// 		{ key: 7, n: "Anaida", s: "F", m: 15,f: 14, a: ["C","F","K"]},
		// 		{ key: 8, n: "Emma", s: "F", m: 4,f: 5, a: ["C","F","K"]},
		// 		{ key: 9, n: "Aslanbek", s: "M",a: ["C","F","K"]},
		// 		{ key: 10, n: "Zarema", s: "F", m: 8, a: ["C","F","K"]},
		// 		{ key: 11, n: "Marina", s: "F", m: 8,f: 9, a: ["C","F","K"]},
		// 		{ key: 12, n: "Zarina", s: "F", m: 8,f: 9, a: ["C","F","K"]},
		// 		{ key: 13, n: "Dzerassa", s: "F", m: 8,f: 9, a: ["C","F","K"]},
		// 		{ key: 14, n: "Aleksandr", s: "M",a: ["C","F","K"]},
		// 		{ key: 15, n: "Unknown", s: "F", a: ["C","F","K"]},
		// 		{ key: 16, n: "Suslanbek", s: "M",a: ["C","F","K"]},
		// 		{ key: 17, n: "Unknown", s: "F", a: ["C","F","K"]},
		// 		{ key: 18, n: "Ivan", s: "M", m: 21,f: 20,a: ["C","F","K"]},
		// 		{ key: 19, n: "Vera", s: "F", a: ["C","F","K"]},
		// 		{ key: 20, n: "Unknown", s: "M",a: ["C","F","K"]},
		// 		{ key: 21, n: "Gitsi", s: "F", a: ["C","F","K"]},
		// 		{ key: 22, n: "23", a: ["C","F","K"]}
		// 	],
		// // 	4 /* focus on this person */);
		// console.log($('#peopleData').text().replace('null', ''));
		setupDiagram(myDiagram, JSON.parse( $('#peopleData').text()),1);

	</script>


{% endblock %}
