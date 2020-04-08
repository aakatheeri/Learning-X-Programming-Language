function print(){
	
	if(arguments[0] != undefined && arguments[1] == undefined) {
		return console.log(arguments[0]);
	} else if (arguments[0] != undefined && arguments[1] == true) {
		console.warn(arguments[0]);
	} else if (arguments[0] != undefined && arguments[1] == false) {
		console.error(arguments[0]);
	}
	
}
/* var variable = function() {
	return 0.5
};
console.log(print("CoNSoLe"));
 */

/* var question = confirm("Do you want use any kind of apps available?", "YES");
if(question == true) {
	console.log("YES");
} else {
	console.log("NO");
} */

/* var response = prompt("Tell us everything you know.", "...");
if (response == "I know") {
	console.log("You know!");
} else {
	console.log("You don't know!");
} */

/*
var theNumber = Number(prompt("Pick a number", ""));
print("Your number is the square root of "+ (theNumber*theNumber)); */

/* var value, counter = 1;
value = 1
while (counter<=10) {
	value*=2;
	counter++;
}
console.log(value); */

/* var line = "";
var counter = 0;
while (counter < 10) {
	line = line + "#";
	print(line);
	counter = counter + 1;
}

var line = "";
for (var i = 0; i<10; i++) {
	line+= '#';
	print(line);
} */

/* var question = prompt("What the value of 2 + 2?");
if (question == 4) {
	print ("Something praising");
} else if (question == 3 || question == 5) {
	print ("Almost!");
} else {
	print ("Something mean");
} */

/* print(false == 0);
print("" == 0);
print("5" == 5);

print("Apollo"+5);
print(null+"ify");
print("5"*5);
print("strawberry"*5); */

/* var input = prompt("What is your name?", "Kilgore Trout");
print("Well hello "+ (input || "dear") ); */

/* false || alert("I'm happening!");
true || alert("Not me."); */

/* function add (x,y) {
	return x+y;
}

function multiply (x,y) {
	return x*y;
}

function devide(x,y) {
	return x/y;
}

function isOdd (number) {
	if (number % 2 == 0) {
		return false;
	} else {
		return true;
	}
}

function isEven (number) {
	if (number % 2 == 0) {
		return true;
	} else {
		return false;
	}
}

print("Addition of 2 and 3 is "+add(2,3));
print("Multiplication of 5 and 4 is "+multiply(5,4));
print("Tell me if 2 is even: "+isEven(2));
print("Tell me if 4 is odd: "+isOdd(4)); */

/* 
function absolute (number) {
	if (number < 0) {
		return -number;
	} else {
		return number;
	}
}
print(absolute(-156)); */

/* function alertInPrint(value){
	var alert = print;
	alert(value);
}

alertInPrint("Trobosome!");
alert("Trobo Alert!"); */

/* var variable = "top-level";

function printVariable() {
	print("inside printVariable, the variable holds '" +
		variable +"'.");
}
function test() {
	var variable = "local"
	print("inside test, the variable holds '" + variable + "'.");
	printVariable();
}
test(); */

/* var variable = "top-level";

function parentFunction() {

	var variable = "local";

	function childFunction() {
		print(variable);
	}
	childFunction();
}
parentFunction(); // Local variable will be printed */

/* 
var something = 1;
{
	var something = 2;
	print("Inside: " + something);
}
print("Outside: " + something); */

/* var variable = "top-level";
function parentFunction() {
	var variable = "local";
	function childFunction() {
		print(variable);
	}
	return childFunction;
}
var child = parentFunction();
child(); */

/* function makeAddFunction(amount) {
	function add (number) {
		return number + amount;
	}

	return add;
}

var addTwo = makeAddFunction(2);
var addFive = makeAddFunction(5);
print(addTwo(1) + addFive(1)); */

/* function chicken() {
	return egg();
}

function egg() {
	return chicken();
}

print(chicken() + " came first"); */

/* var add = function(a,b) {
	return a + b;
}

print(add(5,5)); */

/* function greaterThan(x) {
  return function(y) {
    return y > x;
  };
}

var greaterThanTen = greaterThan(10);
print(greaterThanTen(9)); */

//alert("Hello", "Good Evening", "How do you do?", "Goodbye");
//print("T", 2, "D", 5);

/* var name = "Ahmed";
var variable = null;

print(name.length);
print(variable.length); */

/* var student = {color: "grey", name: "Ahmed", age: 24};
student.age = 25;
print(student.name);
print(student.age);
print(student); */

/* var empty = {};
empty.notReally = 1000;
print(empty.notReally); */

/* var things = {"Garbage":true, "Time": 2.5, "Name": "Kaodhe"};
print(things["Garbage"]);
things["Name"] = "ZzZ";
print(things["Name"]);

things.name = "KkK";
print(things.name);
print(things); */

/* var propertyName = "length";
var text = "mainline";
print(text[propertyName]); // Getting length of variable value
print(text.length); */

/* var tupac = {name: "Tupac Shakor", age: 41, albums: 7};
var peteRock = {name: "Pete Rock", age: 41, albums: 5};

delete tupac.albums;

if( !(tupac.albums in tupac) ) {
	tupac.albums = 10;
}

print(tupac);
print(peteRock); */

/* 
var area = {0: "Abu Dhabi",
			1: "Alain",
			2: "Liwa"};
for (var i = 0; i in area; i++) {
	print("The area of number "+i+" is ==> "+area[i]);
} */

/* var listOfNames =["Ahmed", "Jamal", "Salem", "Abdullah", "Omar"];
listOfNames[10] = "Osman";
listOfNames["Index"] = "Suson";
print(listOfNames[1]);
print(listOfNames); */

/* function range(number) {
	var array = [];
	for (var i = 0; i <= number; i++) {
		array[i] = i
	}

	return array;
}

print(range(5)); */

/* var mack = [];
mack.push("Mack");
mack.push("the");
mack.push("Knife");
print(mack.join(" "));
print(mack.pop());
print(mack); */

/* var when = new Date(1980, 1, 1, 4, 50, 34);
print(when);
print(new Date);
print(new Date(1980, 1, 1));
print(new Date(2007, 2, 30, 5, 20,30)); */

/* var today = new Date();

print("Year: " + today.getFullYear() + ", month: " +
	today.getMonth() + ", day: " + today.getDate());
print("Hour: " + today.getHours() + ", minutes: " + today.getMinutes() + ", seconds: " + today.getSeconds());
print("Day of week: " + today.getDay()); */

/* var today = new Date();
print(today.getTime()); */

/* var wallFall = new Date(1989, 10, 9);
var gulfWarOne = new Date(1990, 6, 2);
print(wallFall < gulfWarOne);
print(wallFall == gulfWarOne);
print(wallFall == new Date(1989, 10, 9));

// The right way to compare between objects' values
var wallFall1 = new Date(1989, 10, 9),
wallFall2 = new Date(1989, 10, 9);
print(wallFall1.getTime() == wallFall2.getTime()); */

/* var now = new Date();
print(now.getTimezoneOffset()); // How many minutes are differ from GMT */

/* function nameRecord (id, name, email) {
	return {id: id, name: name, email: email};
}

function addNames(set, ids, names, emails) {
	for (var i = 0; i < names.length; i++) {
		set[i] = nameRecord(ids[i], names[i], emails[i]);
	}
	return set;
}

function removeNames() {
	for (var i = 0; i < names.length; i++) {
		delete set[names[i]];
	}
}

var names = ["Ahmed","Salem","Ali"];
var ids = [1209, 3204, 3560];
var emails = ["ahmed24_5@hotmail.com", "salem_ss@gmail.com", "ali_hamada@hotmail.com"];
var students = {};
students = addNames(students, ids, names, emails);
print(students); */

/* function displayNames() {

	// Create variable used for catch object and its children length
	var argsLength = 0;

	// Check if there is an object arguments or not
	if (arguments[0] != undefined) {
		
		// loop more until 1000 times
		for (var i = 0; i < 1000*1000; i++) {

			// check if value of key (range from 0 to 1,000,000 keys) is defined or not to make sure that only valid keys in object should printed
			if (arguments[0][i] != undefined) {

				// print value of key in object
				print(arguments[0][i]);

				// increase length of object
				argsLength++;

			} else {

				// if value of key in object is undefined just break the loop instead of perform 1,000,000 loop times
				break;
			}
		}
		print("Arguments length is "+argsLength, true);
	} else {
		print("Error: use object in displayNames funciton!", false);
	}
}

function lengthOfObj(object) {
	var objLength = 0;

	for (var i = 0; i < 1000 * 1000; i++) {
		if (object[i] != undefined) {
			objLength++;
		} else {
			break;
		}
	}

	return objLength;
}

var names = {0: "Ahmed", 1: "sa3ad", 2:"Ali", 3:"Obied", 4:"Sami", 5:"Soso", 6:"melad"};
displayNames(names);
displayNames();

names.length = lengthOfObj(names);
print(names.length); */

/* function forEach(array, action) {
	for (var i = 0; i < array.length; i++) {
		action(array[i]);
	}
}

forEach(["Ahmed", "Saaed", "Saleh"], print); */

/* function funcTimer (array, func, sleepTime, initNumber) {
	
	if (initNumber == null) {
		initNumber = -1;
	}
	setTimeout(function() {
		
		initNumber++;
		if (initNumber < array.length) {
			func(array[initNumber]);
			funcTimer(array, func, sleepTime, initNumber);
		}

	}, sleepTime);
	
}
names = ["Ahmed", "Saaed", "Saleh", "Ali"];
funcTimer(names, print, 1000); */

/* print("Hello",true, 0);

var happy = true;
print(happy == true?"You are happy!":"You should be happy!"); */

/* var link = {};
link[0] = {
    name: "Mobde3 Blog",
    owner: "Ahmed Alkatheeri",
    url: "https://mubde3.net"
}

link[1] = {
    name: "Serdal",
    owner: "Abdullah Almuhairi",
    url: "http://serdal.com"
}

link[2] = {
    name: "Microsoft",
    owner: "Microsoft",
    url: "http://www.microsoft.com"
}

print(link[0]["name"], link[1]["name"], link[2]["name"]); */

/* function forEach(value, method) {
	return method(value);
}
function tag (name, content ,attributes) {
    return {name: name, content: content, attributes: attributes};
}

function link (target, text) {
    return tag("a", text, {href:target});
}

function image (src, alt) {
	return tag("img", [], {src: src, alt: alt});
}
function htmlDoc (title, bodyContent) {
    return tag("html", [tag("head", [tag("title", [title])]),
                      tag("body", bodyContent)]);
}

function escapeHTML(text) {
  var replacements = [[/&/g, "&amp;"],
                      [/</g, "&lt;"], [/>/g, "&gt;"]];
  forEach(replacements, function(replace) {
    text = text.replace(replace[0], replace[1]);
  });
  return text;
}

function renderHTML(element) {
  var pieces = [];

  function renderAttributes(attributes) {
    var result = [];
    if (attributes) {
      for (var name in attributes) 
        result.push(" " + name + "=\"" +
                    escapeHTML(attributes[name]) + "\"");
    }
    return result.join("");
  }

  function render(element) {
    // Text node
    if (typeof element == "string") {
      pieces.push(escapeHTML(element));
    }
    // Empty tag
    else if (!element.content || element.content.length == 0) {
      pieces.push("<" + element.name +
                  renderAttributes(element.attributes) + "/>");
    }
    // Tag with content
    else {
      pieces.push("<" + element.name +
                  renderAttributes(element.attributes) + ">");
      forEach(element.content, render);
      pieces.push("</" + element.name + ">");
    }
  }

  render(element);
  return pieces.join("");
}

print(renderHTML(link("http://www.mubde3.net", "My Website")));
print(renderHTML(image("http://media.mubde3.net/images/e2ce2_2313413_jsd.jpg", "One Of many pictures"))); */

/* function open() {

	var date = new Date();
	print("This device (" + this.name + ") openning in " + date.toDateString());
}

function close() {
	print("Closed");
}

function messaging(msg) {
	print(msg);
}

var txPhone = {name: "Tx Phone 1", open: open};

txPhone.open();

messaging.apply(txPhone,["New message"]);
messaging.call(txPhone, "Another new message");
 */

/* function Car(name) {

	this.name = name;

	this.moving = function (direction) {
		print("The car is moving to " + direction);
	}

	this.renameCar = function (newName) {
		this.name = newName;
	}

}

var car = new Car("Altima");
car.moving("Right");
print(car.name);
car.renameCar("Maxima");
print(car.name); */

/* function Car(name) {
	return {
		name: name,
		moving: function(direction) {
			print("The car is moving to " + direction);
		}
	}
}

var altima = Car("Altima");
Car.prototype.model = 2006;
print(altima.model);
altima.model = 2007;
print(altima.model);
print(Car.prototype.model);
 */

// Using eval to process String as a code
//eval("print(\"My name is Ahmed Alkatheeri .. \")");

// Opening new window
/* var webpage = window.open("http://www.mubde3.net/");
var inTime = setTimeout(function() {
	// Closing a window
	webpage.close();
},3000); */

/*
// print the current url href of page
print(document.location.href);

// print the title of page
print(document.title);

// Using encode and decode functions in Javascript
var encoded = encodeURIComponent("humied in house");
print(encoded);
print(decodeURIComponent(encoded)); */

/************************ Document-Object Model ********************** */
/*																	   */
/*																	   */
/*																	   */
/*																	   */
/*																	   */
/********************************************************************* */

/* function dom_process() {

	// Output body in document
	print(document.body);

	// Output parent of body in document which is html element
	print(document.body.parentNode);

	// Output how many child-elements of body in document
	print(document.body.childNodes.length);

	// Output first-child of document which is head
	print(document.documentElement.firstChild);

	// Output last-child of document which is body
	print(document.documentElement.lastChild);

	// Output previous sibling of body element in document
	print(document.body.previousSibling);

	// Output next sibling of body element in document
	print(document.body.nextSibling);

}

function xDomStyle () {
	print(document.body.firstChild);

	// Editing some elements on page using [firstChild],[nexySibling],[getElementsByTagName]
	document.body.firstChild.nextSibling.innerHTML = ">x Eloquent Javascript";
	document.body.getElementsByTagName("blockquote")[0].innerHTML = "<blockquote>You waste my time as you do in yuor bathroom! ~ Nofr</blockquote>";
	document.body.getElementsByTagName("h1")[2].innerHTML = "A Simple web form";

	// Create new elements and text value to it
	var newElement = document.createElement("h1");
	var newTextNode = document.createTextNode("New Headline is created!");

	// Append textNode to h1 element and append h1 element to body element
	newElement.appendChild(newTextNode)
	document.body.appendChild(newElement);

	var bnIMG = document.createElement("img");
	bnIMG.setAttribute("src", "http://upload.wikimedia.org/wikipedia/en/thumb/7/7e/Soyuz-TMA-08M-Mission-Patch.png/577px-Soyuz-TMA-08M-Mission-Patch.png");
	bnIMG.setAttribute("width", (577/2) + "px");
	bnIMG.setAttribute("height", (599/2) + "px");
	//document.body.appendChild(bnIMG);
	print(bnIMG.getAttribute("src"));

	var newDiv = document.createElement("div");
	newDiv.style.textAlign = "center";
	newDiv.appendChild(bnIMG);
	document.body.appendChild(newDiv);
	//newDiv.style.display = "none";

	// Animate img element by setInterval function
	/* bnIMG.style.position = "absolute";
	var angle = 0;
	var spin = setInterval(function () {
		angle+= 0.15;
		bnIMG.style.left = (100 + 100 * Math.cos(angle) + "px");
		bnIMG.style.top = (100 + 100 * Math.sin(angle) + "px");
	}, 50);

	setTimeout(function() {
		clearInterval(spin);
		
	},5000); */

	/*
	// Print out width and height (Inner and Outer) of image
	print("Outer size: " + bnIMG.offsetWidth + " by " + bnIMG.offsetHeight + " pixels.");
	print("Inner size: " + bnIMG.clientWidth + " by " + bnIMG.clientHeight + " pixels.");
}
 */
//dom_process();

/************************ Events Handling **************************** */
/*																	   */
/*																	   */
/*																	   */
/*																	   */
/*																	   */
/********************************************************************* */

/* var boxElement = document.getElementById("box");
boxElement.style.position = "absolute";
boxElement.style.width = "250px";
boxElement.style.height = "200px";
boxElement.style.top = "100px";
boxElement.style.left = "100px";
boxElement.style.backgroundColor = "grey";
boxElement.addEventListener("click", function () {
	print("You clicked on #" + boxElement.getAttribute("id") + " at (" + event.x + ", " + event.y + ") ");

});

boxElement.removeEventListener("click", function() {
	print("You removed event listener!");
}, null);

var textfieldElement = document.createElement("input");
textfieldElement.setAttribute("id", "textInput");
textfieldElement.setAttribute("type", "text");
textfieldElement.style.position = "absolute";
textfieldElement.style.top = "100px";
textfieldElement.style.left = "360px";
textfieldElement.style.height = "25px";
textfieldElement.style.paddingRight = "10px";
textfieldElement.style.paddingLeft = "10px";
document.body.firstChild.nextSibling.appendChild(textfieldElement);

var eventHandler = function () {
	print("Event action! ");
}
var textInput = document.getElementById("textInput");
textInput.addEventListener("focus", eventHandler, false);

setTimeout(function() {
	textInput.removeEventListener("focus", eventHandler, false);
},1000); */

/* There are many events in DOM event handling like (click, focus, blur, 
	change, copy, cut, paste, keydown, keyup, keypress,
	 load, scholl, select, submit, ...) */
