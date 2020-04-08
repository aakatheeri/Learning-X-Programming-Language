process.on('SIGTERM', function() {
	console.log('terminating');
	process.exit(1);
});

setTimeout(function() {
	console.log('sending SIGTERM to process %d', process.pid);
	process.kill(process.pid, 'SIGTERM');
}, 500);

setTimeout(function() {
	console.log('never called');
}, 1000);

/* if (err.errno === process.ENOENT) {
	// Display a 404 "Not Found" page
} else  {
	// Display a 500 "Internal Server Error" page
} */

var EventEmitter = require('events').EventEmitter;
var emitter = new EventEmitter;

emitter.on('name', function(first, last){
	console.log(first + ', ' + last);
});

emitter.emit('name', 'tj', 'holewaychuk');
emitter.emit('name', 'simon', 'Kath');