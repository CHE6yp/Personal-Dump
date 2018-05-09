$( document ).ready(function() {
	var people = $(".person").get();
	console.log('dssd');
	for (var i = people.length - 1; i >= 0; i--) {
		console.log('34');
		if (i!=people.length - 1)
			drawLine(people[i],people[i+1]);
			// connect(people[i],people[i+1],"blue","5px");
	}

	// function getOffset( el ) {
	//     var rect = el.getBoundingClientRect();
	//     return {
	//         left: rect.left + window.pageXOffset,
	//         top: rect.top + window.pageYOffset,
	//         width: rect.width || el.offsetWidth,
	//         height: rect.height || el.offsetHeight
	//     };
	// }

	// function connect(div1, div2, color, thickness) { // draw a line connecting elements
	//     var off1 = getOffset(div1);
	//     var off2 = getOffset(div2);
	//     // bottom right
	//     var x1 = off1.left + off1.width;
	//     var y1 = off1.top + off1.height;
	//     // top right
	//     var x2 = off2.left + off2.width;
	//     var y2 = off2.top;
	//     // distance
	//     var length = Math.sqrt(((x2-x1) * (x2-x1)) + ((y2-y1) * (y2-y1)));
	//     // center
	//     var cx = ((x1 + x2) / 2) - (length / 2);
	//     var cy = ((y1 + y2) / 2) - (thickness / 2);
	//     // angle
	//     var angle = Math.atan2((y1-y2),(x1-x2))*(180/Math.PI);
	//     // make hr
	//     var htmlLine = "<div style='padding:0px; margin:0px; height:" + thickness + "px; background-color:" + color + "; line-height:1px; position:absolute; left:" + cx + "px; top:" + cy + "px; width:" + length + "px; -moz-transform:rotate(" + angle + "deg); -webkit-transform:rotate(" + angle + "deg); -o-transform:rotate(" + angle + "deg); -ms-transform:rotate(" + angle + "deg); transform:rotate(" + angle + "deg);' />";
	//     //
	//     // alert(htmlLine);
	//     document.body.innerHTML += htmlLine;
	// }
	function getOffset( el ) {
	    var _x = 0;
	    var _y = 0;
	    while( el && !isNaN( el.offsetLeft ) && !isNaN( el.offsetTop ) ) {
	        _x += el.offsetLeft - el.scrollLeft;
	        _y += el.offsetTop - el.scrollTop;
	        el = el.offsetParent;
	    }
	    return { top: _y, left: _x };
	}

	function drawLine(first, second) {
		var fromPoint = getOffset($('#first')[0]);
		var toPoint = getOffset($('#second')[0]);

		var from = function () {},
		to = new String('to');
		from.y = fromPoint.top+10;
		from.x = fromPoint.left+10;
		to.y = toPoint.top+10; 
		to.x = toPoint.left+10;

		$.line(from, to);
	}
});