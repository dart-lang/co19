/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeWhere(bool test(E element))
 * Removes all elements of this list that satisfy test.
 * ...
 * Throws an UnsupportedError if this is a fixed-length list.
 * @description Checks that [UnsupportedError] is thrown since [Float32x4List]
 * is a fixed-size list.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  var length = l.length;
  try {
    l.removeWhere((e) => false);
    Expect.fail("This operation should not be supported");
  } on UnsupportedError {};
  Expect.equals(length, l.length);

  try {
    l.removeWhere((e) => true);
    Expect.fail("This operation should not be supported");
  } on UnsupportedError {};
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([pack(1.0)]);
  check([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)]);
}
