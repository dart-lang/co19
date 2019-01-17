/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 *@assertion Stream<E> asyncMap<E>(FutureOr convert(T event))
 * Creates a new stream with each data event of this stream asynchronously
 * mapped to a new event.
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

check(FutureOr convert(event)) async {
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);

  Stream stream1 = receiver.asyncMap(convert);
  Expect.isFalse(stream1.isBroadcast);
  var stream = receiver.asBroadcastStream();
  Stream stream2 = stream.asyncMap(convert);
  Expect.isTrue(stream2.isBroadcast);
  receiver.close();
}

main() {
  check((e) => null);
  check((e) => [e]);
  check((e) => [e, e]);
  check((e) => [1, 2, 3, 4]);
}
