/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> skipWhile(bool test(T element))
 * Skip data events from this stream while they are matched by test.
 * . . .
 * The returned stream is a broadcast stream if this stream is. For a broadcast
 * stream, the events are only tested from the time the returned stream is
 * listened to.
 *
 * @description Checks that the returned stream is a broadcast stream if this
 * stream is.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((socket) {
    Stream s1 = socket.skipWhile((e) => false);
    Expect.isFalse(s1.isBroadcast);
    Stream bcs = socket.asBroadcastStream();
    Stream s2 = bcs.skipWhile((e) => false);
    Expect.isTrue(s2.isBroadcast);
  });
}
