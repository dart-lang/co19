/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32List.fromList(List<int> elements)
 * ...
 * Values are truncated to fit in the list when they are copied, the same way
 * storing values truncates them.
 * @description Checks that values are truncated to fit in the list when they
 * are copied.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";
import "../toInt32.lib.dart";

void check(List<int> array) {
  Int32List l = new Int32List.fromList(array);
  Expect.equals(l.length, array.length);
  Expect.listEquals(array.map(toInt32).toList(), l);
  for (int i = 0; i < l.length; ++i) {
    Expect.notEquals(array[i], l[i]);
  }
}

main() {
  check([2147483648, -2147483649]);
  check([4294967297, -4294967297]);
}
