/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> expand<S>(Iterable<S> convert(T value))
 * Creates a new stream from this stream that converts each element into zero
 * or more events.
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

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket socket = await RawDatagramSocket.bind(localhost, 0);
  Stream bcs = socket.asBroadcastStream();
  Stream stream1 = socket.expand((e) => [1, 2, 3]);
  Expect.isFalse(stream1.isBroadcast);
  Stream stream2 = bcs.expand((e) => [1, 2]);
  Expect.isTrue(stream2.isBroadcast);
  socket.close();
}
