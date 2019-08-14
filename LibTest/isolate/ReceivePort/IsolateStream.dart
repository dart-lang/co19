/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
import "dart:async";
import "dart:isolate";

void iMain(List data) {
  SendPort replyPort = data[0];
  SendPort replyPort2 = data[1];
  ReceivePort receivePort = new ReceivePort();
  ReceivePort receivePort2 = new ReceivePort();
  replyPort2.send([receivePort.sendPort, receivePort2.sendPort]);
  receivePort.listen((var element) {
    replyPort.send(element);
  });
  receivePort2.listen((var element) {
    replyPort2.send(null);
    receivePort.close();
    receivePort2.close();
  });
}

ReceivePort fromFuture(Future content) {
  var element;
  bool completed = false;
  SendPort sendPort;
  SendPort sendPort2;
  void sendElement() {
    if (sendPort != null && completed) {
      sendPort.send(element);
      sendPort2.send(null);
    }
  }

  content.then((value) {
    element = value;
    completed = true;
    sendElement();
  });
  ReceivePort receivePort = new ReceivePort();
  ReceivePort receivePort2 = new ReceivePort();
  Isolate.spawn(iMain, [receivePort.sendPort, receivePort2.sendPort]);
  receivePort2.listen((portList) {
    if (portList != null) {
      sendPort = portList[0];
      sendPort2 = portList[1];
      sendElement();
    } else {
      receivePort.close();
      receivePort2.close();
    }
  });
  return receivePort;
}

ReceivePort fromIterable(Iterable content, {onDone(): null}) {
  ReceivePort receivePort = new ReceivePort();
  ReceivePort receivePort2 = new ReceivePort();
  receivePort2.listen((portList) {
    if (portList != null) {
      SendPort sendPort = portList[0];
      SendPort sendPort2 = portList[1];
      for (var element in content) {
        sendPort.send(element);
      }
      sendPort2.send(null);
    } else {
      receivePort.close();
      receivePort2.close();
      if (onDone != null) {
        onDone();
      }
    }
  });
  Isolate.spawn(iMain, [receivePort.sendPort, receivePort2.sendPort]);
  return receivePort;
}
