/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isMulticast
 * Returns [true] if the [InternetAddresss] scope is multicast.
 * @description Checks that [isLinkLocal] returns [true] for multicast IPv4
 * addresses (i.e. for [224.0.0.0] - [239.255.255.255]).
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("225.14.17.1");
  Expect.isTrue(address.isMulticast);
}
