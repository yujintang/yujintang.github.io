---
title: net模块创建一个简单的tcp服务
date: 2016-10-24 14:33:22
tags: Node.js
---

## server.js
```javascript
const net = require('net');

var server = net.createServer(function (socket) {
    console.log('server connected');
    socket.on('end', function () {
        console.log('server disconnected');
    });
    socket.on('data', function (data) {
        socket.end('This message from server!');
        console.log(data.toString());
    });
});

server.listen(22222, function () {
    console.log('server bound port 22222');
});
```
## client.js
```javascript
const net = require('net');

var client = net.connect({port: 22222}, function () {
    console.log('client connected');
    client.write('This message from client');
});

client.on('data', function (data) {
    console.log(data.toString());
    client.end();
});

client.on('end', function () {
    console.log('client disconnected');
});
```
