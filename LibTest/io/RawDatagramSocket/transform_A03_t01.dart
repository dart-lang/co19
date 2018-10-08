/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Stream<S> transform <S>(
 *     StreamTransformer<RawSocketEvent, S> streamTransformer
 * )
 * . . .
 * The streamTransformer can return any stream. Whether the returned stream is
 * a broadcast stream or not, and which elements it will contain, is entirely
 * up to the transformation.
 *
 * @description Checks that the returned stream is a broadcast, if this is.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

StreamTransformer<RawSocketEvent, int> transformer =
    new StreamTransformer.fromHandlers(handleData: (x, sink) {
  sink.add(x == RawSocketEvent.write ? 1 : x == RawSocketEvent.read ? 2 : 3);
});

main() {
  var address = InternetAddress.loopbackIPv4;
  RawDatagramSocket.bind(address, 0).then((socket) {
    Stream s1 = socket.transform(transformer);
    Expect.isFalse(s1.isBroadcast);
    Stream bcs = socket.asBroadcastStream();
    Stream s2 = bcs.transform(transformer);
    Expect.isTrue(s2.isBroadcast);
  });
}
