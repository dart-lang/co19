// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void setAll(int index, Iterable<E> iterable)
/// ...
/// If iterable is based on this list, its values may change /during/ the setAll
/// operation.
///
/// @description Checks that if iterable is based on this list, its values may
/// change during the `setAll` operation.
/// @author sgrekhov22@gmail.com

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 f32x4(v) => new Float32x4.splat(v);

listEquals(List<Float32x4> expected, Float32x4List actual) {
  Expect.equals(expected.length, actual.length);
  for (int i = 0; i < expected.length; ++i) {
    Expect.equals(expected[i].w, actual[i].w);
    Expect.equals(expected[i].x, actual[i].x);
    Expect.equals(expected[i].y, actual[i].y);
    Expect.equals(expected[i].z, actual[i].z);
  }
}

main() {
  var list = [
    f32x4(1.1), f32x4(2.1), f32x4(3.1), f32x4(4.1), f32x4(5.1),
    f32x4(6.1), f32x4(7.1), f32x4(8.1), f32x4(9.1)
  ];

  var l = new Float32x4List.fromList(list);
  var buffer = l.buffer;
  var view = new Float32x4List.view(buffer,
      3 * Float32x4List.bytesPerElement, 3);

  listEquals([f32x4(4.1), f32x4(5.1), f32x4(6.1)], view);
  l.setAll(2, view);
  listEquals([
    f32x4(1.1), f32x4(2.1), f32x4(4.1), f32x4(5.1), f32x4(6.1),
    f32x4(6.1), f32x4(7.1), f32x4(8.1), f32x4(9.1)
  ], l);

  listEquals([f32x4(5.1), f32x4(6.1), f32x4(6.1)], view);
  l.setAll(4, view);
  listEquals([
    f32x4(1.1), f32x4(2.1), f32x4(4.1), f32x4(5.1), f32x4(5.1),
    f32x4(6.1), f32x4(6.1), f32x4(8.1), f32x4(9.1)
  ], l);

  listEquals([f32x4(5.1), f32x4(5.1), f32x4(6.1)], view);
  l.setAll(0, view);
  listEquals([
    f32x4(5.1), f32x4(5.1), f32x4(6.1), f32x4(5.1), f32x4(5.1),
      f32x4(6.1), f32x4(6.1), f32x4(8.1), f32x4(9.1)
  ], l);

  listEquals([f32x4(5.1), f32x4(5.1), f32x4(6.1)], view);
}
