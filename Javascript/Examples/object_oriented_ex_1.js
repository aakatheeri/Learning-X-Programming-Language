function print () {
	for (var i = 0; i < arguments.length; i++) {
		console.log(arguments[i]);
	}
}

function getKeyFromObject(object, index) {
	var keyes = [];

	for (var key in object) {
		if(object.hasOwnProperty(key)) {
			keyes.push(key);
		}
	}

	return keyes[index];
}

function getNumberOfKeyesInObject (object) {
	var keyes = [];

	for (var key in object) {
		if(object.hasOwnProperty(key)) {
			keyes.push(key);
		}
	}

	return keyes.length;
}

/* 

function getObjectInString(object) {

	var objectInString = "{", numberOfKeyes = getNumberOfKeyesInObject(object), currentKey = 0;
	
	function isLastKey(currentKey) {
		if (currentKey == numberOfKeyes - 1) {
			return true;
		} else {
			return false;
		}
	}

	for (var key in object) {

		if (isLastKey(currentKey)) {
			objectInString+= " " + key + ": " + object[key];
		} else {
			objectInString+= " " + key + ": " + object[key] + ", ";
		}

		currentKey+=1;

	}
	
	objectInString+= " }";

	return objectInString;
}

// Creating object using constructor function pattern
var Members = function (groupName) {
	this.groupName = groupName;
	this.members = [];
}

Members.prototype.add = function (id, firstname, lastname) {
	this.members.push({id: id, firstname: firstname, lastname: lastname});
}

Members.prototype.print = function (showInNormalList) {

	print("The members of group " + this.groupName + ":");

	if (showInNormalList == undefined) {
		showInNormalList = false;
	}

	if (showInNormalList == false) {
		for (var i = 0; i < this.members.length; i++) {
			if (i == this.members.length - 1) {
				print(getObjectInString(this.members[i]));
			} else {
				print(getObjectInString(this.members[i]) + ", ");
			}
		}
	} else {
		for (var i = 0; i < this.members.length; i++) {
			print("#"+ this.members[i].id +": " + this.members[i].firstname + " " + this.members[i].lastname);
		}
	}
}

var Student = function() {
	Members.call(this); // call the Members constructor
}

Student.prototype = new Members();
Student.prototype.constructor = Student;
Student.prototype.print = function () {
	print("New Student");
}

var zuStudents = new Members("ZU Students");
zuStudents.add(1,"Ahmed", "Alkathiri");
zuStudents.add(2, "Khamis", "Alhafite");
zuStudents.print();
var khamis = new Student();
khamis.print();

// Check if khamis if kind of Student and Members classes
print(khamis instanceof Student);
print(khamis instanceof Members); */

/* var CFGame = function(name) {
	
	if (name != undefined) {
		this.name = name;
	} else {
		this.name = "[Just a Game]";
	}

	this.gameObjects = [];

	this.createSky = function(time) {
		if (time == "Morning") {
			print("Creating Blue Sky ..");
		} else if (time == "Evening") {
			print("Creating Black Sky ..");
		} else {
			print("Creating Default Sky ..");
		}
	}

	this.createNewObject = function(object) {

		function validateObject() {
			// First key is name
			if(getKeyFromObject(object, 0) == "name" && getKeyFromObject(object, 1) == "type" && getKeyFromObject(object, 2) == "size" && getKeyFromObject(object, 3) == "location") {
				return true;
			} else {
				return false;
			}
		}

		// Taking name, type, size, location
		if (validateObject()) {
			this.gameObjects.push(object);
		}
	}

	this.getObjectByName = function (name) {
		for (var i = 0; i < this.gameObjects.length; i++) {
			if (this.gameObjects[i].name == name) {
				return this.gameObjects[i];
			}
		}
	}

	this.gameSummary = function() {
		print("Game name: " + this.name );
		print("Game Objects: " + this.gameObjects.length);
	}

	this.renderObject = function() {

		if(arguments[0] != undefined) {
			var lineSamble = '-', space = '\s', newLine = '\n';
			var numberOfXSpaces = 0, numberOfYSpaces = 0, xLines = lineSamble, yLines = lineSamble, xSpaces = space, ySpaces = space;

			// Found how many spaces 
			for (var i = 0; i < arguments[0].location.x; i++) {
				//numberOfXSpaces+=1;
				xSpaces+=xSpaces;
				
			}

			for (var j = 0; j < arguments[0].location.y; j++) {
				//numberOfYSpaces+=1;
				ySpaces+=ySpaces;
			}

			if(arguments[0].type == "Lines") {
				// Found the length of object (width, height)
				for (var i = 0; i < arguments[0].size.width; i++) {
					xLines+=xLines;
				}

				for (var j = 0; j < arguments[0].size.height; j++) {
					yLines+=yLines;
				}

				// return how many lines + spaces
				return [xLines, yLines, xSpaces, ySpaces];
			} else {
				return 0;
			}
		}

	}

	this.display = function() {
		print(this.renderObject(this.getObjectByName(this.gameObjects[1].name)));
	}

	return this;

}

var myGame = new CFGame("Loft In The Street");
myGame.createSky("Morning");
myGame.createNewObject({
	name: "Hole",
	type: "Circle",
	size: {width: 100, height: 100},
	location: {x: 10, y: 10}
});
myGame.createNewObject({
	name: "Sharp",
	type: "Line",
	size: {width: 100, height: 2},
	location: {x: 40, y: 40}
});
myGame.gameSummary();
print("", (myGame.getObjectByName("Sharp")));
myGame.display(); */