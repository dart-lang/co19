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
    {Duration period = const Duration(milliseconds: 1), int attempts = 5,
      bool closeProducer = true}) async {
  for (int attempt = 0; attempt < attempts; attempt++) {
    List<int> bytesWritten = await sendDatagramOnce(producer, data, address, port,
        period: period);
    if (wasSent(bytesWritten)) {
      compareSentData(data, bytesWritten);
      if (closeProducer) {
        producer.close();
      }
      return true;
    }
  }
  producer.close();
  return false;
}

/***
 * Check that there is any buffer size > 0
 */
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
    var datagram = receiver.receive();
    if (event == null || _event == event) {
      received.add(datagram?.data);
    }
    if (_event == RawSocketEvent.closed) {
      if(!completer.isCompleted) {
        completer.complete(received);
      }
    }
  });
  new Future.delayed(delay, () {
    if(!completer.isCompleted) {
      receiver.close();
      completer.complete(received);
    }
  });
  return f;
}

/**
 * If we receive datagram we check if received data can be found among sent ones
 */
compareReceivedData(List<List<int>> sent, List<List<int>> received) {
  Expect.isTrue(received.length <= sent.length, "${received.length} <= ${sent.length}");
  for (int i = 0; i < received.length; i++) {
    if (received[i] == null) {
      continue;
    }
    bool found = false;
    for (int j = 0; j < sent.length; j++) {
      if (_listEquals(received[i], sent[j])) {
        found = true;
        break;
      }
    }
    Expect.isTrue(found, "${received[i]} not found among $sent");
  }
}

bool _listEquals(List<int> list1, List<int> list2) {
  if (list1.length == list2.length) {
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        return false;
      }
    }
    return true;
  }
  return false;
}

Future<List<RawSocketEvent>> anyElement(RawDatagramSocket receiver,
    RawSocketEvent expectedEvent, bool shouldFind,
    {Duration delay = const Duration(seconds: 2)}) {
  List<RawSocketEvent> tested = [];
  Completer<List<RawSocketEvent>> completer =
      new Completer<List<RawSocketEvent>>();
  Future<List<RawSocketEvent>> f = completer.future;

  bool test(x) {
    tested.add(x);
    receiver.receive();
    if (x == RawSocketEvent.closed) {
      if (!completer.isCompleted) {
        completer.complete(tested);
      }
    }
    return x == expectedEvent;
  }

  receiver.any((event) => test(event)).then((value) {
    if (shouldFind) {
      Expect.equals(true, value);
    } else {
      Expect.equals(false, value);
    }
    if (!completer.isCompleted) {
      receiver.close();
      completer.complete(tested);
    }
  });

  new Future.delayed(delay, () {
    if (!completer.isCompleted) {
      receiver.close();
    }
  });
  return f;
}

checkTested<T>(List<T> tested, T expected) {
  for (int i = tested.length - 2; i >= 0; i--) {
    Expect.notEquals(expected, tested[i]);
  }
}

checkReceived(check, List<RawSocketEvent> expectedValues, int expectedLen,
    {int attempts = 5}) async {
  for (int i = 0; i < attempts; i++) {
    List list = await check();
    int listLen = list.length;
    if (listLen == 0) {
      continue;
    }
    if (listLen > 0 && listLen <= expectedLen) {
      for (int i = 0; i < list.length; i++) {
        Expect.isTrue(
            expectedValues.contains(list[i]), "Unexpected value ${list[i]}");
      }
      break;
    }
    if (listLen > expectedLen) {
      Expect.fail("$listLen elements found instead of $expectedLen.");
    }
    if (i == attempts - 1) {
      print('$listLen elements found. Look like test failed.');
    }
  }
}
