/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<RawSecureSocket> single
 * The single element of this stream.
 * . . .
 * If this is empty or has more than one element, the returned future completes
 * with an error.
 *
 * @description Checks that if this is empty, the returned future completes
 * with an error.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(InternetAddress address) {
  asyncStart();
  SecurityContext sc = new SecurityContext(withTrustedRoots: true);
  RawSecureServerSocket.bind(address, 0, sc).then((server) {
    server.single.then((event) {
      Expect.fail('Future should be completed with Error');
    }, onError: (error) {
      Expect.isTrue(error is StateError);
      asyncEnd();
    });
    server.close();
  });
}

main() {
  check(InternetAddress.ANY_IP_V4);
  check(InternetAddress.ANY_IP_V6);
  check(InternetAddress.LOOPBACK_IP_V4);
  check(InternetAddress.LOOPBACK_IP_V6);
}
