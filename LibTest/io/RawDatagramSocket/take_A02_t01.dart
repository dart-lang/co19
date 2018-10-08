/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> take(int count)
 * Provides at most the first count data events of this stream.
 * . . .
 * If this is a broadcast stream, the returned stream is a broadcast stream.
 *
 * @description Checks that if this is a broadcast stream, the returned stream
 * is a broadcast stream.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((socket) {
    Stream s1 = socket.take(1);
    Expect.isFalse(s1.isBroadcast);
    Stream bcs = socket.asBroadcastStream();
    Stream s2 = bcs.take(1);
    Expect.isTrue(s2.isBroadcast);
  });
}
