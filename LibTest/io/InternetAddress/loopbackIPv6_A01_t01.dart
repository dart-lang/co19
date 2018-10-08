/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion InternetAddress ANY_IP_V4
 * IP version 4 loopback address. Use this address when listening on or
 * connecting to the loopback adapter using IP version 4 (IPv4).
 * @description Checks that [LOOPBACK_IP_V4] is an address of IPv4 type in
 * correct format
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

RegExp ipv6 = new RegExp(r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$');

main() {
  Expect.equals(InternetAddress.loopbackIPv6.type, InternetAddressType.IPv6);
  Expect.isTrue(ipv6.hasMatch(InternetAddress.loopbackIPv6.address),
      "Address string does not correspond its type");
}
