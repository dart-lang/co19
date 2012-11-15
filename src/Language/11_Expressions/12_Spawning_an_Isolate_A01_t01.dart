/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawning an isolate is accomplished via what is syntactically an
 * ordinary library call, invoking one of the functions spawnUri() or spawnFunction()
 * defined in the dart:isolate library.
 * However, such calls  have the  semantic effect of creating a new isolate with
 * its own memory and thread of control.
 * @description Checks that a new isolate created with spawnFunction()
 * has its own memory which is not shared with other isolates, using a top-level
 * variable to showcase it.
 * @author rodionov
 * @reviewer kaigorodov
 */

import 'dart:isolate';

var topLevelVariable;

void iMain() {
  port.receive((var message, SendPort replyTo) {
    Expect.isNull(topLevelVariable);
    topLevelVariable = 10;
    replyTo.send("pong", null);
    port.close();
  });
}

main() {
  receiveHandler(var message) {
    Expect.equals("pong", message);
    Expect.equals(1, topLevelVariable);
  }

  SendPort sp = spawnFunction(iMain);
  topLevelVariable = 1;
  sp.call('ping').then(receiveHandler);
}
