/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<RawSocketEvent> takeWhile(bool test(T element))
 * Forwards data events while test is successful.
 * . . .
 * The returned stream is a broadcast stream if this stream is.
 *
 * @description Checks that if the returned stream is a broadcast stream if this
 * stream is.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((socket) {
    Stream s1 = socket.takeWhile((e) => true);
    Expect.isFalse(s1.isBroadcast);
    Stream bcs = socket.asBroadcastStream();
    Stream s2 = bcs.takeWhile((e) => true);
    Expect.isTrue(s2.isBroadcast);
  });
}