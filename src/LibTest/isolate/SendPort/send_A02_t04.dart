/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The content of message can be: primitive values (null, num, bool,
 * double, String), instances of SendPort, and lists and maps whose elements are
 * any of these. Lists and maps are also allowed to be cyclic.
 * @description Checks that SendPorts, lists and maps containing SendPorts could be sent properly.
 * @author iefremov
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:isolate";
import "send_A02_util.dart";

final int MESSAGES_NUM = 4;

f() {
  int i = 0;
  port.receive((message, replyTo) {
    i++;
    replyTo.send(message);
    if(i == MESSAGES_NUM) {
      port.close();
    }
  });
}

void main() {
  SendPort sport = spawnFunction(f);
  SendPort replyTo = port.toSendPort();
  var messages = [sport, port.toSendPort(), [sport], {"1":port.toSendPort()}];

  int i = 0;
  port.receive((message, reply) {
    if(messages[i] is List) {
      deepListEquals(messages[i], message);
    } else if(messages[i] is Map) {
      deepMapEquals(messages[i], message);
    } else {
      Expect.equals(messages[i], message);
    }
    i++;
    if(i == MESSAGES_NUM) {
      port.close();
    }
    asyncEnd();
  });

  asyncStart();
  for(var v in messages) {
    sport.send(v, replyTo);
  }
}
