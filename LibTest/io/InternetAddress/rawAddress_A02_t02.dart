/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> rawAddress
 * The result is either a [4] or [16] byte long list.
 * @description Checks that for IPv4 addresses result [List] is fixed length.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  InternetAddress address = new InternetAddress("123.14.1.128");
  List<int> list = address.rawAddress;
  Expect.throws(() { list.add(14); }, (e) => e is UnsupportedError);
  Expect.throws(() { list.clear(); }, (e) => e is UnsupportedError);
  Expect.throws(() { list.remove(1); }, (e) => e is UnsupportedError);
}
