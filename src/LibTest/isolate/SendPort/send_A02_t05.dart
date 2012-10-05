/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The content of message can be: primitive values (null, num, bool,
 * double, String), instances of SendPort, and lists and maps whose elements are
 * any of these. Lists and maps are also allowed to be cyclic.
 * @description Checks that cyclic lists are sent properly.
 * @author iefremov
 */

import "dart:isolate";

f() {
  port.receive((message, replyTo) {
    replyTo.send(message);
    port.close();
  });
}

void main() {
  SendPort sport = spawnFunction(f);
  SendPort replyTo = port.toSendPort();

  var cyclicList = [];
  cyclicList.add(cyclicList);
  cyclicList[0].add(cyclicList);

  var cyclicList2 = [1, 2, 3, null];
  cyclicList2.add(cyclicList);
  cyclicList2.add(cyclicList2);

  port.receive((message, reply) {
    Expect.equals(cyclicList2[0], message[0]);
    Expect.equals(cyclicList2[1], message[1]);
    Expect.equals(cyclicList2[2], message[2]);
    Expect.equals(cyclicList2[3], message[3]);

    Expect.identical(message[4], message[4][0]);
    Expect.identical(message[4], message[4][0][0]);

    Expect.equals(cyclicList2[0], message[5][0]);
    Expect.equals(cyclicList2[1], message[5][1]);
    Expect.equals(cyclicList2[2], message[5][2]);
    Expect.equals(cyclicList2[3], message[5][3]);
    Expect.identical(message[5], message[5][5]);
    port.close();
  });

  sport.send(cyclicList2, replyTo);
}