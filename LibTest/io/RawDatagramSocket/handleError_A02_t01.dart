/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<RawSocketEvent> handleError(
 *     Function onError, {
 *     bool test(error)
 * })
 * Creates a wrapper Stream that intercepts some errors from this stream.
 * . . .
 * The returned stream is a broadcast stream if this stream is.
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
    Stream bcs = socket.asBroadcastStream();
    Stream stream1 = socket.handleError((_) {});
    Expect.isFalse(stream1.isBroadcast);
    Stream stream2 = bcs.handleError((_) {});
    Expect.isTrue(stream2.isBroadcast);
    socket.close();
  });
}
