/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 *@assertion Stream<E> asyncMap<E>(dynamic convert(T event))
 * Creates a new stream with each data event of this stream asynchronously
 * mapped to a new event.
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

check(dynamic convert(event)) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((socket) {
    Stream stream1 = socket.asyncMap(convert);
    Expect.isFalse(stream1.isBroadcast);
    var stream = socket.asBroadcastStream();
    Stream stream2 = stream.asyncMap(convert);
    Expect.isTrue(stream2.isBroadcast);
    socket.close();
    asyncEnd();
  });
}

main() {
  check((e) => null);
  check((e) => [e]);
  check((e) => [e, e]);
  check((e) => [1, 2, 3, 4]);
}
