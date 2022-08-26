// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion int operator [](int index)
/// Returns the object at the given index in the list.
/// @description Checks that the element at the given index is returned.
/// @author msyabro

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Uint8List.fromList(list);
  for (int i = 0; i < list.length; ++i) {
    Expect.identical(l.elementAt(i), l[i]);
  }
}

main() {
  check([]);
  check([1]);
  var list = new List<int>.filled(255, null);
  for (int i = 0; i < 255; ++i) {
    list[i] = i;
  }
  check(list);
}
