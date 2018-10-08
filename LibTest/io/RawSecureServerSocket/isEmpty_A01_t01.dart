/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isEmpty
 * Whether this stream contains any elements.
 *
 * Waits for the first element of this stream, then completes the returned
 * future with true. If the stream ends without emitting any elements, the
 * returned future is completed with false.
 *
 * If the first event is an error, the returned future is completed with that
 * error.
 *
 * This operation listens to the stream, and a non-broadcast stream cannot be
 * reused after checking whether it is empty.
 *
 * @description Checks that if this is empty, the returned future completes
 * true.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(InternetAddress address) {
  asyncStart();
  SecurityContext sc = new SecurityContext(withTrustedRoots: true);
  RawSecureServerSocket.bind(address, 0, sc).then((server) {
    server.isEmpty.then((value) {
      Expect.isTrue(value);
    }).whenComplete(() {
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
