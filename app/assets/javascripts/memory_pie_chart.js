$(document).ready(function(){
	var width = $('#leak-suspect-pie').width(),
			radius = width / 6,
			pieWidth = width / 2;

  var r = Raphael("leak-suspect-pie"),
          pie = r.piechart(pieWidth, 150, radius, [55, 20, 13, 32, 5, 1, 2, 10, 56, 78], { legend: ["%%.%% - onCreate", "%%.%% - getImage", "%%.%% - getBitmap", "%%.%% - downloadNetwork"], legendpos: "west", href: ["http://raphaeljs.com", "http://g.raphaeljs.com"]});

  r.text(pieWidth, 10, "Leak Suspect").attr({ font: "20px sans-serif" });

  pie.hover(function () {
      this.sector.stop();
      this.sector.scale(1.1, 1.1, this.cx, this.cy);

      if (this.label) {
          this.label[0].stop();
          this.label[0].attr({ r: 7.5 });
          this.label[1].attr({ "font-weight": 800 });
      }
  }, function () {
      this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");

      if (this.label) {
          this.label[0].animate({ r: 5 }, 500, "bounce");
          this.label[1].attr({ "font-weight": 400 });
      }
  });
})

$(document).ready(function(){
	var width = $('#heap-size-pie').width(),
			radius = width / 6,
			pieWidth = width / 2;

  var r = Raphael("heap-size-pie"),
          pie = r.piechart(pieWidth, 150, radius, [345, 231, 334, 678, 233, 345, 123, 90, 100, 460], { legend: ["%%.%% - onCreate", "%%.%% - getImage", "%%.%% - getBitmap", "%%.%% - downloadNetwork"], legendpos: "west", href: ["http://raphaeljs.com", "http://g.raphaeljs.com"]});

  r.text(pieWidth, 10, "Heap size ratio").attr({ font: "20px sans-serif" });

  pie.hover(function () {
      this.sector.stop();
      this.sector.scale(1.1, 1.1, this.cx, this.cy);

      if (this.label) {
          this.label[0].stop();
          this.label[0].attr({ r: 7.5 });
          this.label[1].attr({ "font-weight": 800 });
      }
  }, function () {
      this.sector.animate({ transform: 's1 1 ' + this.cx + ' ' + this.cy }, 500, "bounce");

      if (this.label) {
          this.label[0].animate({ r: 5 }, 500, "bounce");
          this.label[1].attr({ "font-weight": 400 });
      }
  });
})