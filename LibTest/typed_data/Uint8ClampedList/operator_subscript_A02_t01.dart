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
  var l = new Uint8ClampedList.fromList(list);
  Expect.throws(() {
    l[-1];
  }, (e) => e is RangeError);
  Expect.throws(() {
    l[l.length];
  }, (e) => e is RangeError);
  Expect.throws(() {
    l[0x80000000];
  }, (e) => e is RangeError);
  Expect.throws(() {
    l[0x7fffffff];
  }, (e) => e is RangeError);
}

main() {
  check([]);
  check([1]);
  var list = List<int>.filled(255, 1);
  for (int i = 0; i < 255; ++i) {
    list[i] = i;
  }
  check(list);
}
