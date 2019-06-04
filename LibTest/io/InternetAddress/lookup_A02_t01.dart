/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<InternetAddress>> lookup(String host,
 *   { InternetAddressType type: InternetAddressType.ANY })
 * If [type] is [InternetAddressType.ANY], it will lookup both IP version 4
 * (IPv4) and IP version 6 (IPv6) addresses.
 * @description Checks that created [Future] can contain both IPv4 and IPv6
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

main() {
  Future<List<InternetAddress>> list = InternetAddress.lookup("localhost");
  bool contains4 = false, contains6 = false;

  list.then((addresses) {
    addresses.forEach((InternetAddress addr) {
      if(addr.address == "::1") {
        Expect.equals(InternetAddressType.IPv6, addr.type);
        Expect.isFalse(contains6);
        contains6 = true;
      } else if (addr.address == "127.0.0.1") {
        Expect.equals(InternetAddressType.IPv4, addr.type);
        Expect.isFalse(contains4);
        contains4 = true;
      }
    });
    Expect.isTrue(contains4);
  }, onError: (e) { Expect.fail("Unexpected error appeared: $e"); });
}
