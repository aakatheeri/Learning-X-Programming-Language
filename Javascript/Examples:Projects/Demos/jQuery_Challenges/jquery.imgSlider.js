(function($) {

	$.fn.imgSlider = function(config) {
		
		var configuratoin = {
			dicular: 'Hor', 
			stayDuration: 2000, 
			animateDuration: 500, 
			easing: 'swing'
		};

		$.extend(configuratoin, config);

		this.each(function() {

			// Define this element, images, length of images variables
			var $this = $(this),
				imgList = $this.find('ul'),
				imgObjects = $this.find('ul li img'),
				imgWidth = $this.find('ul li img').width();
				imgLength = $this.find('ul li img').length;


			// Add some elements to implement sliding
			$this.addClass('imgSlider').append('<div class="container"></div>').children('ul').appendTo($('.container'));
			$this.parent().append('<div class="imgSliderCounter"></div>');
			
			// Add counter next of images container
			var imgSlideCounter = $('.imgSliderCounter');
			for (var i = 0; i < imgLength; i++) {
				imgSlideCounter.append('<span>'+(i+1)+'</span>');
			}

			// implement images sliding by using interval time loop function with counting how many times of loop
			var counter = 1,
				cssProperty;

			// Animate images list position every custom milliseconds by using setInterval function (interval timing function)
			var	slideLoop = setInterval(function() {
				console.log(counter);
				
				// Select css property to change depend on configuratoin.dicular value
				if (configuratoin.dicular == 'Hor') {
					if (counter < imgLength) {
						imgList.stop().animate({'left': -(imgWidth * counter)}, configuratoin.animateDuration, configuratoin.easing);
						counter++;
					} else {
						counter=1;
						imgList.stop().animate({'left': 0}, configuratoin.animateDuration, configuratoin.easing);
					}
				} else {
					if (counter < imgLength) {
						imgList.stop().animate({'top': -(imgWidth * counter)}, configuratoin.animateDuration, configuratoin.easing);
						counter++;
					} else {
						counter=1;
						imgList.stop().animate({'top': 0}, configuratoin.animateDuration, configuratoin.easing);
					}
				}

				
			}, configuratoin.stayDuration);

			// implement images sliding by click of any counter items
			imgSlideCounter.children('span').on('click', function() {

				// Stop interval timing function
				clearInterval(slideLoop);
				var $this = $(this);
				$this.parent().children().removeClass('current');
				$this.addClass('current');
				
				// Select css property to change depend on configuratoin.dicular value
				if (configuratoin.dicular == 'Hor') {
					imgList.stop().animate({'left': -($this.index() * imgWidth)}, configuratoin.animateDuration, configuratoin.easing);
				} else {
					imgList.stop().animate({'top': -($this.index() * imgWidth)}, configuratoin.animateDuration, configuratoin.easing);
				}
			});



		});
		
	}

}(jQuery));