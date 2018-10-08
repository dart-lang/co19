/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion InternetAddress ANY_IP_V4
 * IP version 4 any address. Use this address when listening on all adapters IP
 * addresses using IP version 4 (IPv4).
 * @description Checks that [ANY_IP_V4] is an address of IPv4 type in correct
 * format
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

RegExp ipv4 = new RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$');

main() {
  Expect.equals(InternetAddress.anyIPv4.type, InternetAddressType.IPv4);
  Expect.isTrue(ipv4.hasMatch(InternetAddress.anyIPv4.address),
      "Address string does not correspond its type");
}
