/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion InternetAddress(String address)
 * If the [address] in address is not a numeric IPv4 (dotted-decimal notation)
 * or IPv6 (hexadecimal representation) address [ArgumentError] is thrown.
 * @description Checks that attempt to create an [InternetAddress] with
 * IPv4 address in decimal format causes an [ArgumentError].
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  Expect.throws(() { new InternetAddress("3221226219"); },
      (e) => e is ArgumentError);
}
