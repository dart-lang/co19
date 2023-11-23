// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int operator [](int index)
/// ...
/// or throws a [RangeError] if index is out of bounds.
/// @description Checks that an exception is thrown as expected.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  Expect.throws(() { l[-1];         }, (e) => e is RangeError);
  Expect.throws(() { l[l.length];   }, (e) => e is RangeError);
  Expect.throws(() { l[0x80000000]; }, (e) => e is RangeError);
  Expect.throws(() { l[0x7fffffff]; }, (e) => e is RangeError);
}

main() {
  check([]);
  check([pack(1.0)]);
  List<Float32x4> list = List<Float32x4>.filled(255, pack(0.0));
  for (int i = 0; i < 255; ++i) {
    list[i] = pack(i * 1.0);
  }
  check(list);
}
