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
 * @description Checks that various lists are sent properly.
 *
 * @author kaigorodov
 */
import "dart:isolate";
import "../../../Utils/expect.dart";
import "send_A01_util.dart";

void iMain(SendPort replyPort) {
  var lists = makeLists();
  for(var v in lists) {
    replyPort.send(v);
  }
}

makeLists() {
  var lists = [
    const [], const [1,2,3], const [const[], const[const[]]],
    messagesList, [messagesList], [[], [messagesList]], [{"1" : messagesMap}]
  ];

  return lists;
}

main() {
  var receivePort = new ReceivePort();
  var lists = makeLists();
  asyncStart();
  Isolate.spawn(iMain, receivePort.sendPort);
  int i = 0;
  
  receivePort.listen((message) {
    Expect.listEquals(lists[i], message);
    i++;
    if (i == lists.length) {
      receivePort.close();
      asyncEnd();
    }
  });
}
