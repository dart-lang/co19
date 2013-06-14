/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void send(message, [SendPort replyTo])
 * The content of message can be: primitive values (null, num, bool,
 * double, String), instances of SendPort, and lists and maps whose elements are
 * any of these. Lists and maps are also allowed to be cyclic.
 * @description Checks that various lists could be sent properly.
 * @author iefremov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "send_A02_util.dart";

f() {
  int i = 0;
  var lists = makeLists();
  port.receive((message, replyTo) {
    deepListEquals(lists[i], message);
    i++;

    replyTo.send(message);
    if(i == lists.length) {
     port.close();
    }
  });
}

makeLists() {
  var lists = [
    const [], const [1,2,3], const [const[], const[const[]]],
    messagesList, [messagesList], [[], [messagesList]], [{"1" : messagesMap}]
  ];

  return lists;
}

void main() {
  SendPort sport = spawnFunction(f);
  SendPort replyTo = port.toSendPort();

  var lists = makeLists();

  int i = 0;
  port.receive((message, reply) {
    deepListEquals(lists[i], message);
    i++;
    if(i == lists.length) {
     port.close();
    }
    asyncEnd();
  });

  for(var v in lists) {
    asyncStart();
    sport.send(v, replyTo);
  }
}
