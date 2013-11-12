$(document).ready(function(){
	var margin = {top: 20, right: 20, bottom: 30, left: 40}
	var width = $("#network-latency-bar-chart").width() - margin.left - margin.right;
	var height = 300 - margin.top - margin.bottom;

	var x = d3.scale.ordinal().rangeRoundBands([0,width], .1, 1);

	var y = d3.scale.linear().range([height, 0]);

	var xAxis = d3.svg.axis().scale(x).orient("bottom");
	var yAxis = d3.svg.axis().scale(y).orient("left");


	var svg = d3.select("#network-latency-bar-chart").append("svg")
				.attr("width", width + margin.left + margin.right)
				.attr("height", height + margin.top + margin.bottom)
				.append("g")
				.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	var url = window.location.pathname.split('/');

	d3.json("/reports/" + url[url.length - 1] + "/network.json", function(error, data){

		data.forEach(function (d) {
			d.latency = +d.latency;
		});

		x.domain(data.map(function(d){return d.id + ' ' + d.name;}));
		y.domain([0, d3.max(data, function(d){return d.latency;})]);

		svg.append("g")
				.attr("class", "x axis")
				.attr("transform", "translate(0," + height + ")")
				.call(xAxis);

		svg.append("g")
				.attr("class", "y axis")
				.call(yAxis)
			.append("text")
				.attr("transform", "rotate(-90)")
				.attr("y", 6)
				.attr("dy", ".71em")
				.style("text-anchor", "end")
				.text("Latency");

		svg.selectAll(".bar")
					.data(data)
				.enter().append("rect")
					.attr("class", "bar")
					.attr("x", function(d){return x(d.id + ' ' + d.name);})
					.attr("width", x.rangeBand())
					.attr("y", function(d){return y(d.latency);})
					.attr("height", function(d){return height - y(d.latency);});

		d3.select("input").on("change", change);

		var sortTimeout = setTimeout(function(){
			d3.select("input").property("checked", true).each(change);
		}, 2000);

		function change(){
			clearTimeout(sortTimeout);

			var x0 = x.domain(data.sort(this.checked
					? function(a, b){return b.latency - a.latency;}
					: function(a, b){return d3.ascending(a.id, b.id);})
					.map(function(d){return d.id + ' ' + d.name;}))
					.copy();

			var transition = svg.transition().duration(750),
					delay = function(d, i){return i * 50;}

			transition.selectAll(".bar")
					.delay(delay)
					.attr("x", function(d){return x0(d.id + ' ' + d.name);});

			transition.select(".x.axis")
					.call(xAxis)
				.selectAll("g")
					.delay(delay);
		}
	});
});

