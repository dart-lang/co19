/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(Object element)
 * Removes the first occurrence of value from this list.
 * Returns true if value was in the list, false otherwise.
 * The method has no effect if value was not in the list.
 * An UnsupportedError occurs if the list is fixed-length.
 * @description Checks that [UnsupportedError] is thrown since [Float32x4List]
 * is a fixed-size list.
 * @note undocumented
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list, element) {
  Float32x4List l = new Float32x4List.fromList(list);
  int length = l.length;
  try {
    l.remove(element);
    Expect.fail("This operation should not be supported");
  } on UnsupportedError {};
  Expect.equals(length, l.length);
}

main() {
  check([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], pack(1.0));
  check([pack(0.0)], pack(0.0));

  check([
    pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
    pack(7.0), pack(8.0), pack(9.0), pack(10.0)
  ], pack(0.0));
  check([], pack(1.0));
}
