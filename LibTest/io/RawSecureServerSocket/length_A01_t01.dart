/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> length
 * The number of elements in this stream.
 *
 * Waits for all elements of this stream. When the stream ends, the returned
 * future is completed with the number of elements.
 *
 * @description Checks that if this is empty, the returned future completes
 * with 0.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

check(InternetAddress address) {
  asyncStart();
  SecurityContext sc = new SecurityContext(withTrustedRoots: true);
  RawSecureServerSocket.bind(address, 0, sc).then((server) {
    server.length.then((value) {
      Expect.equals(0, value);
    }).whenComplete(() {
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
