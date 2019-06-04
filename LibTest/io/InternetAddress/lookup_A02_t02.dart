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
 * @description Checks that created [Future] contains IPv4 and IPv6 addresses
 * and each address string corresponds type of [InternetAddress] object.
 * [InternetAddressType.ANY].
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

RegExp ipv4 = new RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$');
RegExp ipv6 = new RegExp(r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$');

check(String name) {
  Future<List<InternetAddress>> list =
    InternetAddress.lookup(name, type: InternetAddressType.ANY);

  list.then((addresses) {
    addresses.forEach((InternetAddress addr) {
      if(addr.type == InternetAddressType.IPv4) {
        Expect.isTrue(ipv4.hasMatch(addr.address),
            "Address string does not correspond its type");
      } else {
        Expect.isTrue(ipv6.hasMatch(addr.address),
            "Address string does not correspond its type");
      }
    });
  }, onError: (e) { Expect.fail("Unexpected error appeared: $e"); });
}

main() {
  check("localhost");
  check("google.com");
}