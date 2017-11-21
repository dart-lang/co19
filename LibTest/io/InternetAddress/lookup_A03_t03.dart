/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<InternetAddress>> lookup(String host,
 *   { InternetAddressType type: InternetAddressType.ANY })
 * If type is either [InternetAddressType.IP_V4] or [InternetAddressType.IP_V6]
 * it will only lookup addresses of the specified type.
 * @description Checks that if type is set to [InternetAddressType.IP_V4] result
 * [Future] list contains IPv4 addresses only.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";
import "dart:async";

RegExp ipv4 = new RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$');

main() {
  Future<List<InternetAddress>> list =
    InternetAddress.lookup("localhost", type: InternetAddressType.IP_V4);

  list.then((addresses) {
    addresses.forEach((InternetAddress addr) {
      Expect.isTrue(ipv4.hasMatch(addr.address),
          "Address string does not correspond its type");
    });
  }, onError: (e) { Expect.fail("Unexpected error appeared: " + e); });
}
