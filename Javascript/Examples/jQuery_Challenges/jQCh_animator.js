$(function() {

	var ContentDivision = {
		container: $('.content'),
		config: {
			colors: ['red', 'blue'],
			duration: 1000,
			count: 2
		},
		repeat: function(config) {
			$.extend(this.config, config);
			var counting = 1,
				cd = ContentDivision,
				cn = cd.container,
				config = cd.config;

			var inv = window.setInterval(function() {
				

				if(counting <= cd.config.count) {
					cd.container.animate({
						'backgroundColor': cd.config.colors[counting-1]
					}, cd.config.duration);
					//console.log(counting);
				}

				// 'this' here is 'window'
				//console.log(this);
				
				console.log(counting);
				counting++;
			} , cd.config.duration);


			setTimeout(function() {
				window.clearInterval(inv);
			}, (cd.config.count * cd.config.duration) + cd.config.duration);

			// 'this' here is 'ContentDivision'
			//console.log(this);
		}
	}

	var colors = ['red', 'yellow', 'green'];
	ContentDivision.repeat({
		colors: colors,
		duration: 2000,
		count: colors.length
	});

});