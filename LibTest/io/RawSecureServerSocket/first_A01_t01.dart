/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future<RawSecureSocket> first
 * The first element of the stream.
 * . . .
 * If this stream is empty (a done event occurs before the first data event),
 * the returned future completes with an error.
 *
 * @description Checks that if this is empty, the returned future completes
 * with an error.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  SecurityContext sc = new SecurityContext(withTrustedRoots: true);
  RawSecureServerSocket.bind(address, 0, sc).then((server) {
    server.first.then((event) {
      Expect.fail('Future should be completed with Error');
    }, onError: (error) {
      Expect.isTrue(error is StateError);
      asyncEnd();
    });
    server.close();
  });
}

main() {
  check(InternetAddress.anyIPv4);
  check(InternetAddress.anyIPv6);
  check(InternetAddress.loopbackIPv4);
  check(InternetAddress.loopbackIPv6);
}
