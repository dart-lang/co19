/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int8List.fromList(List<int> elements)
 * ...
 * Values are truncated to fit in the list when they are copied, the same way
 * storing values truncates them.
 * @description Checks that values are truncated to fit in the list when they
 * are copied.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";
import "../toInt8.lib.dart";

void check(List<int> list) {
  Int8List l = new Int8List.fromList(list);
  Expect.equals(l.length, list.length);
  Expect.listEquals(list.map(toInt8).toList(), l);
}

main() {
  check([128, -129]);
  check([1000, 1001, 1002]);
  check([-1000, -1001, -1002]);
  check([1024, 2048, 4096]);
  check([-1024, -2048, -4096]);
}
