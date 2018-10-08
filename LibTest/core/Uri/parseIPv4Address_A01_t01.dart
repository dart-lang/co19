/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> parseIPv4Address(String host)
 * Parse the host as an IP version 4 (IPv4) address, returning the address as a
 * list of 4 bytes in network byte order (big endian).
 *
 * Throws a FormatException if host is not a valid IPv4 address representation.
 * @description Checks that this method parses the host as an IP version 4
 * (IPv4) address, returning the address as a list of 4 bytes in network byte
 * order (big endian)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.listEquals([127, 0, 0, 1], Uri.parseIPv4Address("127.0.0.1"));
  Expect.listEquals([1, 1, 1, 1], Uri.parseIPv4Address("1.1.1.1"));
}
