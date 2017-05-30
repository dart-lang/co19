/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int16List.fromList(List<int> elements)
 * ...
 * Values are truncated to fit in the list when they are copied, the same way
 * storing values truncates them.
 * @description Checks that values are truncated to fit in the list when they
 * are copied.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";
import "../toInt16.lib.dart";

void check(List<int> list) {
  Int16List l = new Int16List.fromList(list);
  Expect.equals(l.length, list.length);
  Expect.listEquals(list.map(toInt16).toList(), l);
}

main() {
  check([32768, -32769]);
  check([40000, 40001, 40002]);
  check([-40000, -40001, -40002]);
  check([65536, 131072, 262144]);
  check([-65536, -131072, -262144]);
}
