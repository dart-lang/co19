// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void setAll(int index, Iterable<E> iterable)
/// ...
/// If `iterable` is based on this list, its values may change during the
/// `setAll` operation.
///
/// @description Checks that if `iterable` is based on this list the operation
/// does not fail.
/// @author sgrekhov22@gmail.com
/// @issue 54078

import "dart:typed_data";

Float32x4 f32x4(v) => new Float32x4.splat(v);

main() {
  var list = [
    f32x4(1.1), f32x4(2.1), f32x4(3.1), f32x4(4.1), f32x4(5.1),
    f32x4(6.1), f32x4(7.1), f32x4(8.1), f32x4(9.1)
  ];

  var l = new Float32x4List.fromList(list);
  var buffer = l.buffer;
  var view = new Float32x4List.view(buffer,
      3 * Float32x4List.bytesPerElement, 3);
  // The values below are not checked; the result of this operation is unspecified.
  l.setAll(2, view);
  l.setAll(4, view);
  l.setAll(0, view);
}
