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
 * @description Checks that cyclic maps are sent properly.
 * @author iefremov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

void iMain(List data) {
  SendPort replyPort=data[0];
  var message=data[1];
  replyPort.send(message);
}

void main() {
  Map cyclicMap = {};
  cyclicMap["0"] = cyclicMap;
  cyclicMap["0"]["0"] = cyclicMap;

  Map cyclicMap2 = {"0":1, "1":2, "2":3, "3":null};
  cyclicMap2["4"] = cyclicMap;
  cyclicMap2["5"] = cyclicMap2;

  ReceivePort receivePort = new ReceivePort();
  asyncStart();
  Isolate.spawn(iMain, [receivePort.sendPort, cyclicMap2]);

  receivePort.listen((message) {    Expect.equals(cyclicMap2["0"], message["0"]);
    Expect.equals(cyclicMap2["1"], message["1"]);
    Expect.equals(cyclicMap2["2"], message["2"]);
    Expect.equals(cyclicMap2["3"], message["3"]);

    Expect.identical(message["4"], message["4"]["0"]);
    Expect.identical(message["4"], message["4"]["0"]["0"]);

    Expect.equals(cyclicMap2["0"], message["5"]["0"]);
    Expect.equals(cyclicMap2["1"], message["5"]["1"]);
    Expect.equals(cyclicMap2["2"], message["5"]["2"]);
    Expect.equals(cyclicMap2["3"], message["5"]["3"]);
    Expect.identical(message["5"], message["5"]["5"]);
    receivePort.close();
    asyncEnd();
  });
}
