/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion InternetAddress ANY_IP_V6
 *  IP version 6 any address. Use this address when listening on all adapters IP
 * addresses using IP version 6 (IPv6).
 * @description Checks that [ANY_IP_V6] is an address of IPv6 type in correct
 * format
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

RegExp ipv6 = new RegExp(r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$');

main() {
  Expect.equals(InternetAddress.anyIPv6.type, InternetAddressType.IPv6);
  Expect.isTrue(ipv6.hasMatch(InternetAddress.anyIPv6.address),
      "Address string does not correspond its type");
}
