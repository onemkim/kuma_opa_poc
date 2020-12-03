// BASE SETUP
// =============================================================================

// call the packages we need
var express    = require('express');
var bodyParser = require('body-parser');
var app        = express();
var morgan     = require('morgan');
var http       = require('http');

// configure app
app.use(morgan('dev')); // log requests to the console

// configure body parser
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var port     = process.env.PORT || 8020; // set our port

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Magic happens on port ' + port);

// test route to make sure everything is working (accessed at GET http://localhost:8010/api)
app.get('/api', function(req, res) {
	console.log('API.. before calling server.');
// console.log(http.request(options, callback).end());
  http.request(options, callback).end();
	console.log('API.. after calling server.');
	res.json({ message: 'Client /api is called !' });
});

var options = {
  host: 'localhost',
  path: '/api',
  port: '8030'
};

callback = function(response) {
  var str = '';

  //another chunk of data has been received, so append it to `str`
  response.on('data', function (chunk) {
    str += chunk;
  });

  //the whole response has been received, so we just print it out here
  response.on('end', function () {
    console.log(str);
  });
}
