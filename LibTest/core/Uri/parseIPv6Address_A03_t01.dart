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
 * Acts on the substring from start to end. If end is omitted, it defaults ot
 * the end of the string.
 * @description Checks that if start and end parameters specified, then only
 * appropriate substring is parsed
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  String address = "FEDC:BA98:7654:3210:FEDC:BA98:7654:3210";
  List<int> expected = [254, 220, 186, 152, 118, 84, 50, 16, 254, 220, 186, 152,
    118, 84, 50, 16];
  Expect.listEquals(expected, Uri.parseIPv6Address("http://" + address +
      ":8080", 7, 7 + address.length));

  Expect.listEquals(expected, Uri.parseIPv6Address("http://" + address, 7));

  Expect.throws(() {
    Uri.parseIPv6Address("http://FEDC:BA98:7654:3210:FEDC:BA98:7654:3210:8080",
        7);
  }, (e) => e is FormatException);

}
