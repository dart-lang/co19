/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> map<S>(S convert(T event))
 * Creates a new stream that converts each element of this stream to a new value
 * using the convert function.
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
    Stream stream1 = socket.map((e) => e);
    Expect.isFalse(stream1.isBroadcast);
    Stream bcs = socket.asBroadcastStream();
    Stream stream2 = bcs.map((e) => e);
    Expect.isTrue(stream2.isBroadcast);
  });
}
