/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void send(message, [SendPort replyTo])
 * The content of message can be: primitive values (null, num, bool,
 * double, String), instances of SendPort, and maps and maps whose elements are
 * any of these. Lists and maps are also allowed to be cyclic.
 * @description Checks that various maps could be sent properly.
 * @author iefremov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "send_A02_util.dart";

f() {
  int i = 0;
  var maps = makeMaps();
  port.receive((message, replyTo) {
    Expect.deepMapEquals(maps[i], message);
    i++;
    replyTo.send(message);
    if(i == maps.length) {
     port.close();
    }
  });
}

makeMaps() {
  var maps = [
    const {}, const {"1:":1, "2":2, "3":3}, const {"1":const{}, "2":const{"1":const{}}},
    messagesMap, {"1":messagesMap}, {"1":{}, "2":{"3":messagesMap}},
    {"1" : messagesList}
  ];

  return maps;
}

void main() {
  SendPort sport = spawnFunction(f);
  SendPort replyTo = port.toSendPort();

  var maps = makeMaps();

  int i = 0;
  port.receive((message, reply) {
    Expect.deepMapEquals(maps[i], message);
    i++;
    if(i == maps.length) {
     port.close();
    }
    asyncEnd();
  });

  for(var v in maps) {
    asyncStart();
    sport.send(v, replyTo);
  }
}