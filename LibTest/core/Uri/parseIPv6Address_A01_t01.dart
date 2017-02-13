/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> parseIPv6Address(String host, [int start = 0, int end])
 * Parse the host as an IP version 6 (IPv6) address, returning the address as a
 * list of 16 bytes in network byte order (big endian).
 *
 * @description Checks that this method parses the host as an IP version 6
 * (IPv6) address, returning the address as a list of 16 bytes in network byte
 * order (big endian)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.listEquals([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
      Uri.parseIPv6Address("::1"));
  Expect.listEquals([254, 220, 186, 152, 118, 84, 50, 16, 254, 220, 186, 152,
    118, 84, 50, 16],
      Uri.parseIPv6Address("FEDC:BA98:7654:3210:FEDC:BA98:7654:3210"));
  Expect.listEquals([63, 254, 42, 0, 1, 0, 112, 49, 0, 0, 0, 0, 0, 0, 0, 1],
      Uri.parseIPv6Address("3ffe:2a00:100:7031::1"));
  Expect.listEquals([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 129, 144, 52, 38],
      Uri.parseIPv6Address("::FFFF:129.144.52.38"));
  Expect.listEquals([32, 16, 131, 107, 65, 121, 0, 0, 0, 0, 0, 0, 131, 107, 65,
    121], Uri.parseIPv6Address("2010:836B:4179::836B:4179"));
}
