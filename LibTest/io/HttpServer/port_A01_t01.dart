// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int port
/// Returns the port that the server is listening on. This can be used to get the
/// actual port used when a value of 0 for port is specified in the bind or
/// bindSecure call.
/// @description Checks that this property returns the port that the server is
/// listening on
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  HttpServer? server = null;
  HttpServer.bind(InternetAddress.loopbackIPv4, 0).then((HttpServer s) async {
    server = s;
    bool used = false;
    try {
      await HttpServer.bind(InternetAddress.loopbackIPv4, s.port);
    } on SocketException catch (_) {
      used = true;
    }
    Expect.isTrue(used);
    asyncEnd();
  }).whenComplete(() {
    server?.close();
  });
}
