// Webserver for clientside pages

var express = require('express')
var app = express()

app.get('/', function (req, res) {
  res.sendfile("www/home.html")
})

var server = app.listen(3000, function () {

  var host = server.address().address
  var port = server.address().port

  console.log('Webserver app listening at http://%s:%s', host, port)

})
