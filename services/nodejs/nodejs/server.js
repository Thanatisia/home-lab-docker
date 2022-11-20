// Load express module with 'require' function
var express = require('express')
var app = express()
var SRC_PORT = 8080

// Define request response in root URL (/) and response with text Hello World
app.get('/', function(req, res) {
    res.send("Hello World!")
})

// Launch listening server on port 8080 and console the log
app.listen(SRC_PORT, function() {
    console.log("App listening on port 8080!")
})
