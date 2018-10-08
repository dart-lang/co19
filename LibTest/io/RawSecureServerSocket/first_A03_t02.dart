/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future<RawSecureSocket> first
 * The first element of the stream.
 * . . .
 * Except for the type of the error, this method is equivalent to
 * this.elementAt(0).
 *
 * @description Checks that if this is empty, method this.elementAt(0) completes
 * with an error not equal to the error thrown by [first].
 * @author ngl@unipro.ru
 */
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  SecurityContext sc = new SecurityContext(withTrustedRoots: true);
  RawSecureServerSocket.bind(address, 0, sc).then((server) {
    server.elementAt(0).then((event) {
      Expect.fail('Future should be completed with Error');
    }, onError: (error) {
      Expect.isTrue(error is RangeError);
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
