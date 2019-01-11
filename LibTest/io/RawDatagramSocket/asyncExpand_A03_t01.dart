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
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

check(Stream convert(event)) async {
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);

  Stream stream1 = receiver.asyncExpand(convert);
  Expect.isFalse(stream1.isBroadcast);
  var stream = receiver.asBroadcastStream();
  Stream stream2 = stream.asyncExpand(convert);
  Expect.isTrue(stream2.isBroadcast);
  receiver.close();
}

main() {
  check((e) => null);
  check((e) => new Stream.fromIterable([e]));
  check((e) => new Stream.fromIterable([e, e]));
}
