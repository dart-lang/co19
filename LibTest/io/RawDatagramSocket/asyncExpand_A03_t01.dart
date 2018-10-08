/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE  eventfile.
 */
/**
 * @assertion Stream<E> asyncExpand<E>(Stream<E> convert(T event))
 * Transforms each element into a sequence of asynchronous events.
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

check(Stream convert(event)) {
  asyncStart();
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((socket) {
    Stream stream1 = socket.asyncExpand(convert);
    Expect.isFalse(stream1.isBroadcast);
    var stream = socket.asBroadcastStream();
    Stream stream2 = stream.asyncExpand(convert);
    Expect.isTrue(stream2.isBroadcast);
    socket.close();
    asyncEnd();
  });
}

main() {
  check((e) => null);
  check((e) => new Stream.fromIterable([e]));
  check((e) => new Stream.fromIterable([e, e]));
}
