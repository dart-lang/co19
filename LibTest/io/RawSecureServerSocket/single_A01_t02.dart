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
 * @description Checks that if the returned future completes with an error, this
 * may be empty.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  SecurityContext sc = new SecurityContext(withTrustedRoots: true);
  RawSecureServerSocket.bind(address, 0, sc).then((server) {
    Stream<RawSecureSocket> bs = server.asBroadcastStream();
    bs.single.then((event) {
      Expect.fail('Future should be completed with Error');
    }, onError: (error) {
      Expect.isTrue(error is StateError);
      bs.isEmpty.then((value) {
        Expect.isTrue(value);
        asyncEnd();
      });
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
