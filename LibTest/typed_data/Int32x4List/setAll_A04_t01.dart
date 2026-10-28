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

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5)];
  var l = new Int32x4List.fromList(list);
  var buffer = l.buffer;
  var view = new Int32x4List.view(buffer, Int32x4List.bytesPerElement * 2, 3);

  // The values below are not checked; the result of this operation is unspecified.
  l.setAll(1, view);
  l.setAll(3, view);
  l.setAll(0, view);
}
