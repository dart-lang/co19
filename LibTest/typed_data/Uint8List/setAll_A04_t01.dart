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

import "dart:typed_data";

main() {
  var list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  var l = new Uint8List.fromList(list);
  var buffer = l.buffer;
  var l1 = new Uint8List.view(buffer, 3, 4);

  // The values below are not checked; the result of this operation is unspecified.
  l.setAll(2, l1);
  l.setAll(6, l1);
  l.setAll(0, l1);
}
