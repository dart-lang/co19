/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * http and web sockets utils
 * @author a.semenov@unipro.ru
 */
library http_utils;

import "dart:io";
import "dart:async";
import "../../Utils/expect.dart";

/**
 * Spawns a HttpServer instance
 */
Future<HttpServer> spawnHttpServer(void requestHandler(HttpRequest request)) async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen(requestHandler);
  return server;
}

/**
 * Spawns a HttpServer instance that is intended to handle web sockets.
 */
Future<HttpServer> spawnWebSocketServer(void wsHandler(WebSocket webSocket)) {
  return spawnHttpServer((HttpRequest request) {
    WebSocketTransformer.upgrade(request).then(wsHandler);
  });
}

/**
 * Spawns a HttpServer instance that is intended to handle web sockets.
 * Each new connection receives the same [content] and then closed.
 */
Future<HttpServer> spawnStaticContentWebSocketServer(content) {
  return spawnWebSocketServer((WebSocket webSocket) {
    webSocket.add(content);
    webSocket.close();
  });
}

/**
 * Spawns a HttpServer instance that is intended to handle web sockets.
 * Each new connection is listened for first message and send it back,
 * then web socket is closed.
 */
Future<HttpServer> spawnEchoWebSocketServer() {
  return spawnWebSocketServer((WebSocket webSocket) async {
    webSocket.add(await webSocket.first);
    webSocket.close();
  });
}

List<int> _bigData = null;

List<int> get bigData  {
 if (_bigData == null) {
   _bigData = getList(8187);
 }
 return _bigData;
}

List<int> getList(int size) {
  List<int> l = [];
  for (int j = 0; j < size; j++) {
    l.add(j);
  }
  return l;
}

Future<List<int>> sendDatagramOnce(RawDatagramSocket producer,
    List<List<int>> data, InternetAddress address, int port,
    {Duration period = const Duration(milliseconds: 1)}) {
  List<int> sent = [];
  Completer<List<int>> completer = new Completer<List<int>>();
  Future<List<int>> f = completer.future;
  if (data != null) {
    int i = 0;
    new Timer.periodic(period, (timer) {
      if (i < data.length) {
        sent.add(producer.send(data[i++], address, port));
      } else {
        timer.cancel();
        producer.close();
        completer.complete(sent);
      }
    });
  } else {
    completer.complete(sent);
  }
  return f;
}

Future<bool> sendDatagram(RawDatagramSocket producer, List<List<int>> data,
    InternetAddress address, int port,
    {Duration period = const Duration(milliseconds: 1), int attempts = 5}) async {
  for (int attempt = 0; attempt < attempts; attempt++) {
    List<int> bytesWritten = await sendDatagramOnce(producer, data, address, port,
        period: period);
    if (wasSent(bytesWritten)) {
      compareSentData(data, bytesWritten);
      return true;
    }
  }
  return false;
}

bool wasSent(List<int> bytesWritten) {
  for (int i = 0; i < bytesWritten.length; i++) {
    if (bytesWritten[i] > 0) {
      return true;
    }
  }
  return false;
}

compareSentData(List<List<int>> data, List<int> sentStatus) {
  Expect.equals(sentStatus.length, data.length, "Wrong sizes of sent and sentResult");
  for (int i = 0; i < data.length; i++) {
    if (sentStatus[i] == 0) {
      continue;
    }
    Expect.equals(data[i].length, sentStatus[i]);
  }
}

Future<List<List<int>>> receiveDatagram(RawDatagramSocket receiver,
    {Duration delay = const Duration(seconds: 2), RawSocketEvent event}) {
  List<List<int>> received = [];
  Completer<List<List<int>>> completer = new Completer<List<List<int>>>();
  Future<List<List<int>>> f = completer.future;
  receiver.listen((_event) {
    if (event == null || _event == event) {
      var datagram = receiver.receive();
      if (datagram != null) {
    //    print("Received: ${datagram.data}");
        received.add(datagram.data);
      }
    }
  });
  new Future.delayed(delay, () {
    receiver.close();
    if(!completer.isCompleted) {
      completer.complete(received);
    }
  });
  return f;
}

compareDatagrams(List<List<int>> sent, List<List<int>> received, List<int> sentStatus) {
  Expect.equals(sentStatus.length, sent.length, "Wrong sizes of sent and sentRezult");
  for (int i = 0, k = 0; i < sent.length; i++) {
    if (sentStatus[i] == 0) {
      continue;
    }
    Expect.equals(sent.length, received.length);
    Expect.equals(sent[i].length, received[k].length, "Wrong sizes of sent and received");
    for (int j = 0; j < sent[i].length; j++) {
      Expect.equals(sent[i][j] & 0xff, received[k][j], "Wrong values: i=$i, k=$k, j=$j");
    }
    k++;
  }
}
