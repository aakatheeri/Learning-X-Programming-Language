
/* 
	Exersices:
		-1. (value) should be an email address
		-2. (value) should be a url
		-3. (value) should be a username
		-4. (value) should be a zu username
		-5. (value) should be a YouTube URL
		-6. (value) should be a paragraph with Quotation of APA style
		-7. (value) should be an HTML Tag
		-8. (value) should be a date (YYYY/MM/DD) - YYYY Month D
*/

function print () {
	for (var i = 0; i<arguments.length; i++) {
		console.log(arguments[i]);
	}
}

function randomOf(type, numberOfReturnValue) {

	
	var possibleChars = "ABDEFGHIJKLAMOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!@#$%^&&*()_-.+";
	var text = "";
	for (var i = 0; i < numberOfReturnValue; i++) {

		if(type == "username") {
			text+= possibleChars.charAt(Math.floor(Math.random() * possibleChars.length));
		} else if (type == "password") {
			text+= possibleChars.charAt(Math.floor(Math.random() * possibleChars.length));
		} else {
			text+= Math.floor(Math.random() * 32);
		}

	}

	return text;
	
}

function isMatch(value, withExpression) {
	if (value.match(withExpression)) {
		return true;
	} else {
		return false;
	}
}

function getDate() {

	var date = new Date();
	var dateStringPattern = date.toDateString();
	var currentDate = getCurrentDate(dateStringPattern);

	function getNewDateFormat(format) {

		format = format.replace("{year}",currentDate.year);
		format = format.replace("{month}",currentDate.month);
		format = format.replace("{month:string}", getStringOfMonth(currentDate.month));
		format = format.replace("{month:short-string}", getStringOfMonth(currentDate.month).substr(0,3));
		format = format.replace("{day}",currentDate.day);
		format = format.replace("{day:ordinal}", getDayWithString(currentDate.day));

		return format;

	}

	function getDayWithString(dayInNumber) {
		if(dayInNumber.substr(-1,0) == 1) {
			return dayInNumber + "st";
		} else if(dayInNumber.substr(-1,0) == 2) {
			return dayInNumber + "nd";
		} else if(dayInNumber.substr(-1,0) == 3) {
			return dayInNumber + "rd";
		} else if(dayInNumber.substr(-1,0) == 4) {
			return dayInNumber + "th";
		} else if(dayInNumber.substr(-1,0) == 5) {
			return dayInNumber + "th";
		} else if(dayInNumber.substr(-1,0) == 6) {
			return dayInNumber + "th";
		} else if(dayInNumber.substr(-1,0) == 7) {
			return dayInNumber + "th";
		} else if(dayInNumber.substr(-1,0) == 8) {
			return dayInNumber + "th";
		} else if(dayInNumber.substr(-1,0) == 9) {
			return dayInNumber + "th";
		} else if(dayInNumber.substr(-1,0) == 0) {
			return dayInNumber + "th";
		}
	}

	function getStringOfMonth(monthInNumber) {
		switch(monthInNumber) {
			case 1:
				return "January";
				break;
			case 2:
				return "February";
				break;
			case 3:
				return "March";
				break;
			case 4:
				return "April";
				break;
			case 5:
				return "May";
				break;
			case 6:
				return "June";
				break;
			case 7:
				return "July";
				break;
			case 8:
				return "August";
				break;
			case 9:
				return "September";
				break;
			case 10:
				return "October";
				break;
			case 11:
				return "November";
				break;
			case 12:
				return "December";
				break;
		}
	}

	function getNumberOfMonth(monthInString) {

		switch(monthInString) {
			case "Jan":
				return 1;
				break;
			case "Feb":
				return 2;
				break;
			case "Mar":
				return 3;
				break;
			case "Apr":
				return 4;
				break;
			case "May":
				return 5;
				break;
			case "Jun":
				return 6;
				break;
			case "Jul":
				return 7;
				break;
			case "Aug":
				return 8;
				break;
			case "Sep":
				return 9;
				break;
			case "Oct":
				return 10;
				break;
			case "Nov":
				return 11;
				break;
			case "Dec":
				return 12;
				break;
		}

		
	}

	function getCurrentDate(dateInString) {
		var year = dateInString.slice(-4);
		var month = getNumberOfMonth(dateInString.slice(4,7));
		var day = dateInString.slice(8,10);
		return {year:year,month:month,day:day};
	}

	if (arguments.length > 0) {
		return getNewDateFormat(arguments[0]);
	} else {
		return date;
	}

}

/* // Matching Email Address
var email = "mobde3.net@gmail.com";
print( isMatch(email, 
	/^([\w]+[-_.+&]*)+@[\w]+[.]+[a-zA-Z]{2,6}$/i
	));

// Matching URL Address
var url = "www.mubde3.net";
print( isMatch(url, 
	/^(((http)([s]?))?[:][\/]{2})?([\w]+([-_]?)+[.])?[\w]+([-_]?)+[.][a-zA-Z]{2,4}$/
	)); */

/* // Matching username
var username = randomOf("username", 8);
print(username + " ==> " + isMatch(username, /^[\w-!$+]{8,32}$/i)); */

/* // Matching ZU username
var zuID = "u2900384";
print(zuID + " ==> " + isMatch(zuID, /^(((200)[789])?)*(([umz][2][6789])?)+[\d]{5}$/i)); */

/* // Matching a YouTube url
var url = "https://www.youtube.com/watch?v=6nU5YwwZgio";
print(isMatch(url, /^((http)([s]?)([:]{1})[\/]{2})?(((www)[.])?)(youtube)[.]([a-zA-Z]{2,4})[/]+(watch\?v=)[\w]{11}$/i)); */

/* // Matching a paragraph with APA Style Quotation

var paragraph = "According to (Lewis, 1963, p. 553) “I do not”";
print(isMatch(paragraph, /^(According to)[\s]\(([A-Z]([a-z]+))[,][\s][\d]{4}(([,][\s]p. [\d]{1,1000})?)\)[\s][“]([\w\s]+)[”]$/i)); */

/* // Matching an HTML tag
var tag = "<div id=\"content\" class=\"alt\">as</div>";
print(isMatch(tag, /^[<][a-z]{1,16}(([\s](id=)["][\w]+["])?([\s](class=)["][\w]+["])?)?[>](([\w]+)?([\W]+)?)(<\/)[a-z]{1,16}[>]$/i)|isMatch(tag, /^[<][a-z]{1,16}(([\s](class=)["][\w]+["])?([\s](id=)["][\w]+["])?)?[>](([\w]+)?([\W]+)?)(<\/)[a-z]{1,16}[>]$/i)?true:false); */

// Matching a date in 2 or 3 patterns at least (yyyy/mm/dd)r (ddnd month yyyy)r (dd month yyyy)r
var date = getDate("{year} {month} {day:ordinal}");
print(date);
print(isMatch(date, /^([\d]{1,2}((st)?(nd)?(th)?)([\/]?[\s]?)[\d]{1,2}([\/]?[\s]?)[\d]{4})?([\d]{4}([\/]?[\s]?)[\d]{1,2}([\/]?[\s]?)[\d]{1,2}((st)?(nd)?(th)?))?$/i));

