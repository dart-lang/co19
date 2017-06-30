/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uint32List.fromList(List<int> list)
 * ...
 * Values are truncated to fit in the list when they are copied, the same way
 * storing values truncates them.
 * @description Checks that elements are truncated when they are copied.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array) {
  Uint32List l = new Uint32List.fromList(array);
  Expect.equals(l.length, array.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(array[i] & 0xffffffff, l[i]);
  }
}

main() {
  check([4294967296, 4294967297]);
  check([5000000000, 5000000001, 5000000002]);
}
