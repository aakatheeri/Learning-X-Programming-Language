(function($) {

	$.fn.colorRepeat = function(config) {
		
		// prepare default arguments
		var configuration = {
			colors: [],
			duration: 1000,
			count: config.colors.length,
			repeat: false
		};

		// extend default configuration to custom arguments
		$.extend(configuration, config);

		// apply effect/method/event to each element used this plugin
		this.each(function() {

			var element = $(this),
			initial = 0,
			interval = window.setInterval(function() {

				// if initial value is less or equal than size of custom colors then apply effect and add 1 to initial
				if (initial < configuration.colors.length) {
					element.animate({
						'backgroundColor': configuration.colors[initial]
					});
					initial++;

					// print initial on console
					console.log(initial);
				}

				// repeat sequence of effect if repeat option is true
				 if (configuration.repeat == true) {
					
					if (initial == configuration.colors.length) {
						initial = 0;
					}
				}

			}, configuration.duration);
			
			// apply the effect each custom time by setInterval functoin 
			interval;

			// stop repeat of changing color effects if repeat option is false
			if(configuration.repeat == false) {
				
				// clear setInterval function after custom milliseconds
				setTimeout(function() {
					window.clearInterval(interval);
				}, (configuration.colors.length * configuration.duration) + configuration.duration/2);
			}

			
			
		});
	}

}(jQuery));