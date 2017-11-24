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
 * incorrect IPv6 address causes an [ArgumentError].
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  Expect.throws(() { new InternetAddress("::::"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress(":::"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress(":"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("192:156:6:23"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("711:8:4"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("2001:0db8::0000::0370:7334"); },
      (e) => e is ArgumentError);
  Expect.throws(() {
    new InternetAddress("2001:-0db8:0000:0042:0000:8a2e:0370:7334");
  }, (e) => e is ArgumentError);
  Expect.throws(() {
    new InternetAddress("2001:9999999999999999:0000:0042:0000:8a2e:0370:7334");
  }, (e) => e is ArgumentError);
  Expect.throws(() {
    new InternetAddress("2001:99:XYZ:0042:0000:8a2e:0370:7334");
  }, (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("192:156:6:23:ab14: 8c10:1:12"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress(": :"); },
      (e) => e is ArgumentError);
  Expect.throws(() { new InternetAddress("192:156:6:23:ab14::8c10:1:12"); },
      (e) => e is ArgumentError);
}
