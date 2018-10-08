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
 * incorrect IPv4 address causes an [ArgumentError].
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  Expect.throws(() { new InternetAddress("12.128.3.14.7"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("..."); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("-7.11.16.8"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("192.156.6."); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("7.11..8"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress(".7.11.8"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("166.11.19"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("9999999999999999999.1.1.0"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("7.11.8:19"); },
      (e) => e is ArgumentError);
}
