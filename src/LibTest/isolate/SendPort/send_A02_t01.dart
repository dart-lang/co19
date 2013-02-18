/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The content of message can be: primitive values (null, num, bool,
 * double, String), instances of SendPort, and lists and maps whose elements are
 * any of these. Lists and maps are also allowed to be cyclic.
 * @description Checks that various primitive values could be sent properly.
 * @author iefremov
 */
import "../../../Utils/expect.dart";
import "dart:isolate";
import "send_A02_util.dart";

f() {
  int i = 0;
  port.receive((message, replyTo) {
    Expect.equals(messagesList[i], message);
    i++;
    replyTo.send(message);
    if(i == messagesList.length) {
      port.close();
    }
  });
}


void main() {
  SendPort sport = spawnFunction(f);
  SendPort replyTo = port.toSendPort();

  int i = 0;
  port.receive((message, reply) {
    Expect.equals(messagesList[i], message);
    i++;
    if(i == messagesList.length) {
      port.close();
    }
  });

  for(var v in messagesList) {
    sport.send(v, replyTo);
  }
}
