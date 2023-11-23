// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Future<RawDatagramSocket> bind(
///   dynamic host,
///   int port,
///   {bool reuseAddress = true,
///   bool reusePort = false,
///   int ttl = 1}
/// )
/// Binds a socket to the given host and port.
/// ...
/// The `reuseAddress` should be set for all listeners that bind to the same
/// address. Otherwise, it will fail with a [SocketException].
///
/// @description Checks that if `reuseAddress` is `false` for both of the
/// sockets then any attempt to bind this address twice will fail with a
/// [SocketException] even if one of the sockets have `reusePort` set to `true`
/// @author sgrekhov22@gmail.com
/// @issue 49600

import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket socket1 =
      await RawDatagramSocket.bind(localhost, 0, reuseAddress: false);
  asyncStart();
  RawDatagramSocket.bind(localhost, socket1.port,
          reuseAddress: false, reusePort: true).then((_) {
    Expect.fail("SocketException expected");
  }, onError: (e) {
    Expect.isTrue(e is SocketException);
    asyncEnd();
  });
}
