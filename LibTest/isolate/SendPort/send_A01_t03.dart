/*
 * Copyright (c) 2011-2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void send(message)
 *    Sends an asynchronous message through this send port, to its corresponding
 * ReceivePort.
 *    The content of message can be: primitive values (null, num, bool, double,
 * String), instances of SendPort, and lists and maps whose elements are any
 * of these. List and maps are also allowed to be cyclic.
 *
 * @description Checks that various maps are sent properly.
 *
 *  @author kaigorodov
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "send_A01_util.dart";

void iMain(SendPort replyPort) {
  var maps = makeMaps();
  for(var v in maps) {
    replyPort.send(v);
  }
}

makeMaps() {
  var maps = [
    const {}, const {"1:":1, "2":2, "3":3},
    const {"1":const{}, "2":const{"1":const{}}},
    messagesMap, {"1":messagesMap}, {"1":{}, "2":{"3":messagesMap}},
    {"1" : messagesList}
  ];

  return maps;
}

main() {
  var receivePort = new ReceivePort();
  var maps = makeMaps();
  asyncStart();
  Isolate.spawn(iMain, receivePort.sendPort);
  int i = 0;
  
  receivePort.listen((message) {
    Expect.mapEquals(maps[i], message);
    i++;
    if (i == maps.length) {
      receivePort.close();
      asyncEnd();
    }
  });
}
