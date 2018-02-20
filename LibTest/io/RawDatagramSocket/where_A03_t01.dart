/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> where (bool test(T event))
 * . . .
 * The returned stream is a broadcast stream if this stream is.
 *
 * @description Checks that the returned stream is a broadcast stream if this
 * stream is.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

main() {
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((socket) {
    Stream s1 = socket.where((e) => true);
    Expect.isFalse(s1.isBroadcast);
    Stream bcs = socket.asBroadcastStream();
    Stream s2 = bcs.where((e) => false);
    Expect.isTrue(s2.isBroadcast);
  });
}
