/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE  eventfile.
 */
/**
 * @assertion Stream<E> asyncExpand<E>(Stream<E> convert(T event))
 * Creates a new stream with the events of a stream per original event.
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

check(Stream convert(event)) {
  asyncStart();
  var address = InternetAddress.LOOPBACK_IP_V4;
  RawDatagramSocket.bind(address, 0).then((socket) {
    var stream = socket.asBroadcastStream();
    Stream stream2 = stream.asyncExpand(convert);
    Expect.isTrue(stream2.isBroadcast);
    socket.close();
  });
}

main() {
  check((e) => null);
  check((e) => new Stream.fromIterable([e]));
  check((e) => new Stream.fromIterable([e, e]));
}
