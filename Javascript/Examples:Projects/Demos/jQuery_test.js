function print() {
	for (var i = 0; i < arguments.length; i++) {
		console.log(arguments[i]);
	}
}

/*

	Practices:
	- project of counting words, characters, punctuation, numbers
	- Creating horizontal navigation
	- creating a box and moving it by animation
	- change background of page every 3 seconds
	- get tweets from and searching about specific word

*/

/* 
	Project 1: Count words, characters, punctuation, 
	numbers from one sentence 


function calculateSentence() {
	var sentence = prompt("Enter a sentence: ", "");
	var chars=0, words=0, puncs=0, numbers=0;

	for (var i = 0; i < sentence.length; i++) {
		if(sentence[i].match(/[a-zA-Z]/i)) {
			chars+=1;
		}
		if(sentence[i].match(/[.,'"!?]/i)) {
			puncs+=1;
		}
		if(sentence[i].match(/[0-9]/i)) {
			numbers+=1;
		}
		if(sentence[i] == " ") {
			words+=1;
		}
		
	}
	print("Your word: " + sentence, "================");
	print("You have " + chars + " characters.");
	print("You have " + puncs + " punctuation.");
	print("You have " + numbers + " numbers.");
	print("You have " + (words+1) + " words.");
}
calculateSentence(); */

/*
	Project 2: Create horizontal navigation

$(document).ready(function() {

	$("body").append("<div id=\"navigation\"><ul><li></li><li></li><li></li></ul></div>");
	var nav = $("#navigation ul");
	var navChild = nav.children();
	navChild[0].innerHTML = "Home";
	navChild[1].innerHTML = "Blog";
	navChild[2].innerHTML = "Contact";

	navChild.css({
		'width': '100px',
		'display': 'inline-block',
		'text-align': 'center',
		'padding': '5px',
		'border-radius': '10px'
	});

	nav.css({
		'border-radius': '10px',
		'backgroundColor': 'grey',
		'width': (parseInt(navChild.first().width() * 3) + 30) + 'px',
		'padding': 0
	});


	navChild.hover(function() {
		$(this).css('backgroundColor', 'red');
	}, function() {
		$(this).css('backgroundColor', nav.css('backgroundColor'));
	});

}); */

/* 
	Project 3: Create a box and moving it by animation

$(document).ready(function() {
	var box = $("#box");
	box.css({
		'width': '90px',
		'height': '90px',
		'backgroundColor': 'blue',
		'position': 'absolute',
		'top': '40px',
		'left': 0
	});

	$("body").click(function (e){
		box.stop().animate({
			'top': parseInt(e.pageY) - box.height()/2,
			'left': parseInt(e.pageX) - box.width()/2
		}, 2000);
	});
}); */

/* 
	Project 4: Change background of page every 3 seconds
	

$(document).ready(function() {
	var body = $("body");
	var colors = ['red', 'blue', 'green', 'black'];

	var index = 0; */
	// Without animation
	/* 
	setInterval(function() {
		
		body.css('backgroundColor', colors[index]);
		if (index < colors.length) {
			index+=1;
		} else {
			index = 0;
		}

	},1000); */

	// With animation
	/* setInterval(function() {
		print(index + ": " + colors[index]);
		body.animate({'backgroundColor': colors[index]}, 600);
		if (index < colors.length-1) {
			index+=1;
		} else {
			index = 0;
		}
		
	},2000); */

/*
	Project 5: Get tweets from and searching about specific word
	*/

function getTweetAtIndex(username, index) {

	$.getJSON("https://api.twitter.com/1/statuses/user_timeline/"+username+".json?include_rts=1&callback=?", function(data) {
		$("#tweets").html("<p>" + data[index].text + "<p>" + "<span>"+ data[index].created_at +"</span>");
	});
}

function getTweets(username, count, isObject) {
	
	$.getJSON("https://api.twitter.com/1/statuses/user_timeline/"+username+".json?count="+count+"&include_rts=1&callback=?",function(data) {
		for(var i = 0; i < count; i++) {
			if(isObject == true) {
				print(data[i]);
			} else {
				$("#tweets").append("<div class=\"tweet\"><p>" + data[i].text + "<p>" + "<span>"+ data[i].created_at +"</span></div>");
			}
		}
	});

	
}

function getTweetAsObject(username) {

	$.getJSON("https://api.twitter.com/1/statuses/user_timeline/"+username+".json?include_rts=1&callback=?", function(data) {
		//$("#tweets").html(data);
		print(data);
		
	});
}

