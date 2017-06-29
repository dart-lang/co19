/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uint16List.fromList(List<int> list)
 * ...
 * Values are truncated to fit in the list when they are copied, the same way
 * storing values truncates them.
 * @description Checks that elements are truncated when they are copied.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(List<int> array) {
  Uint16List l = new Uint16List.fromList(array);
  Expect.equals(l.length, array.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.equals(array[i] & 0xffff, l[i]);
  }
}

main() {
  check([65536, 65537]);
  check([90000, 90001, 90002]);
}
