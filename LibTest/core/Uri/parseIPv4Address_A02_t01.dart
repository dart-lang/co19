/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> parseIPv4Address(String host)
 * ...
 * Throws a FormatException if host is not a valid IPv4 address representation.
 * @description Checks that FormatException is thrown if host is not a valid
 * IPv4 address representation
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    Uri.parseIPv4Address("127.0.0.1:8080");
  }, (e) => e is FormatException);

  Expect.throws(() {
    Uri.parseIPv4Address("http://127.0.0.1");
  }, (e) => e is FormatException);
}
