/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void add(message)
 * Sends an asynchronous message to the linked IsolateStream.
 * The message is copied to the receiving isolate.
 * The content of message can be: primitive values (null, num, bool, double, String),
 * instances of IsolateSinks, and lists and maps whose elements are any of these.
 * List and maps are also allowed to be cyclic.
 
 * In the special circumstances when two isolates share the same code and are running
 * in the same process (e.g. isolates created via spawnFunction),
 * it is also possible to send object instances (which would be copied in the process).
 * This is currently only supported by the dartvm.
 * For now, the dart2js compiler only supports the restricted messages described above.
 
 * @description Checks that various primitive values could be sent properly.
 * @author kaigorodov
 */
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "add_A01_util.dart";

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
    asyncEnd();
  });

  for(var v in messagesList) {
    asyncStart();
    sport.send(v, replyTo);
  }
}

