/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<RawSocketEvent> timeout (
 *     Duration timeLimit, {
 *     void onTimeout(
 *         EventSink<T> sink
 *     )
 * })
 * . . .
 * The returned stream is a broadcast stream if this stream is. If a broadcast
 * stream is listened to more than once, each subscription will have its
 * individually timer that starts counting on listen, and the subscriptions'
 * timers can be paused individually.
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
    Stream s1 = socket.timeout(const Duration(milliseconds: 10));
    Expect.isFalse(s1.isBroadcast);
    Stream bcs = socket.asBroadcastStream();
    Stream s2 = bcs.timeout(const Duration(milliseconds: 10));
    Expect.isTrue(s2.isBroadcast);
  });
}
