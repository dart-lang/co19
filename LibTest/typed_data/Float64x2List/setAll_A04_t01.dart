// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void setAll(int index, Iterable<E> iterable)
/// ...
/// If `iterable` is based on this list, its values may change during the
/// `setAll` operation.
///
/// @description Checks that if `iterable` is based on this list the operation
/// does not fail.
/// @author ngl@unipro.ru
/// @issue 43227

import "dart:typed_data";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var list = [
    f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0),
    f64x2(6.0), f64x2(7.0), f64x2(8.0), f64x2(9.0)
  ];

  var l = new Float64x2List.fromList(list);
  var buffer = l.buffer;
  var view = new Float64x2List.view(buffer,
      3 * Float64x2List.bytesPerElement, 3);

  // The values below are not checked; the result of this operation is unspecified.
  l.setAll(2, view);
  l.setAll(4, view);
  l.setAll(0, view);
}
