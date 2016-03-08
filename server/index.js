const http = require('http');

const server = http.createServer((req,res) => {
  res.writeHead(200, {'Content-Type': 'application/json'});
  res.end(
    JSON.stringify({ status : 200, message : 'OK', path : req.url })
  );
});

server.listen(8080);
