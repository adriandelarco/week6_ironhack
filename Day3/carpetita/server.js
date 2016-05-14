var http = require('http');
var url = require('url');
var fs = require('fs');
var n_load_times = 0 

var server = http.createServer(function(request,response) {
	++n_load_times
	console.log(n_load_times)

	var path = url.parse(request.url).path;
	switch (path) {
		case '/':
			response.writeHead(200, {'Content-type': 'text-json'});
			response.write('{"Greet": "Hello world"}');
			response.end();
			break;
		case '/index.html':
			fs.readFile(__dirname + path, function (error, data) {
				if (error) {
					response.writeHead(200, {'Content-type': 'text-json'});
					response.write('Content not available');
					response.end();
				} else{
					response.writeHead(200, {'Content-type': 'text-json'});
					response.write(data, 'utf8');
					response.end();
				}; 
			})
			break;		
		case '/detect.html':
			fs.readFile(__dirname + path, function (error, data) {
				if (error) {
					response.writeHead(200, {'Content-type': 'text-json'});
					response.write('Content not available');
					response.end();
				} else{
					response.writeHead(200, {'Content-type': 'text-json'});
					response.write(data, 'utf8');
					response.end();
				}; 
			})
			break;
		default:
			// statements_def
			break;
	}
});


var io = require('socket.io')(server);

 io.on('connection', function(socket){
    socket.emit('fooBarEvent', {
        "message" : "These aren't the droids you're looking for.😇"
    });
    socket.on('sendClientData', function(data){
    	console.log(data);
    });
    socket.on('sendDeviceOrientation', function (data) {
    	 console.log(data); 
    	 socket.broadcast.emit('sendCoords', data);
    })
}); 


server.listen(8000);