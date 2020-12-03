// BASE SETUP
// =============================================================================

// call the packages we need
var express    = require('express');
var bodyParser = require('body-parser');
var app        = express();
var morgan     = require('morgan');

// configure app
app.use(morgan('dev')); // log requests to the console

// configure body parser
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var port     = process.env.PORT || 8010; // set our port

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Magic happens on port ' + port);

// test route to make sure everything is working (accessed at GET http://localhost:8010/api)
app.get('/api', function(req, res) {
	console.log('Something is happening in /api.');
	res.json({ message: 'Server /api is called !' });
});
