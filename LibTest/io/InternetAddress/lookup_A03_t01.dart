/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<InternetAddress>> lookup(String host,
 *   { InternetAddressType type: InternetAddressType.ANY })
 * If type is either [InternetAddressType.IPv4] or [InternetAddressType.IPv6]
 * it will only lookup addresses of the specified type.
 * @description Checks that if type is set to [InternetAddressType.IPv6] result
 * [Future] list contains IPv6 addresses only.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

RegExp ipv6 = new RegExp(r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$');

main() {
  Future<List<InternetAddress>> list =
    InternetAddress.lookup("localhost", type: InternetAddressType.IPv6);

  list.then((addresses) {
    addresses.forEach((InternetAddress addr) {
      Expect.isTrue(ipv6.hasMatch(addr.address),
          "Address string does not correspond its type");
    });
  }, onError: (e) { Expect.fail("Unexpected error appeared: $e"); });
}
