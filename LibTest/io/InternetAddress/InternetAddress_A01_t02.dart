/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion InternetAddress(String address)
 * Creates a new [InternetAddress] from a numeric address.
 * @description Checks that new [InternetAddress] object with given address and
 * [IPv6] type is created if [address] is a correct address in IPv6 notation and
 * no omitted zeros in the [address] string.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  InternetAddress address =
    new InternetAddress("2001:0db8:0000:0042:0000:8a2e:0370:7334");
  Expect.equals("2001:0db8:0000:0042:0000:8a2e:0370:7334", address.address);
  Expect.equals(InternetAddressType.IPv6, address.type);
}
