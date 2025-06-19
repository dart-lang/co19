// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int operator [](int index)
/// ...
/// Throws an error if index is out of bounds.
/// @description Checks that an exception is thrown as expected.
/// @author msyabro

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Int8List.fromList(list);
  Expect.throws(() {
    l[-1];
  });
  Expect.throws(() {
    l[l.length];
  });
  Expect.throws(() {
    l[0x80000000];
  });
  Expect.throws(() {
    l[0x7fffffff];
  });
}

main() {
  check([]);
  check([1]);
  var list = List<int>.filled(255, 0);
  for (int i = 0; i < 255; ++i) {
    list[i] = i;
  }
  check(list);
}
