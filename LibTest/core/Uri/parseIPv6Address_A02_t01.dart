/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> parseIPv6Address(String host, [int start = 0, int end])
 * Parse the host as an IP version 6 (IPv6) address, returning the address as a
 * list of 16 bytes in network byte order (big endian).
 * ...
 * Throws a FormatException if host is not a valid IPv6 address representation.
 * @description Checks that FormatException is thrown if host is not a valid
 * IPv6 address representation
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    Uri.parseIPv6Address("127.0.0.1");
  }, (e) => e is FormatException);

  Expect.throws(() {
    Uri.parseIPv6Address("FEDC:BA98:7654:3210:FEDC:BA98:7654:3210:8080");
  }, (e) => e is FormatException);

  Expect.throws(() {
    Uri.parseIPv6Address("http://FEDC:BA98:7654:3210:FEDC:BA98:7654:3210");
  }, (e) => e is FormatException);
}
