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

import "dart:typed_data";

main() {
  var l = new Float32List.fromList(
      [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]);
  // The values below are not checked; the result of this operation is unspecified.
  l.setAll(4, l.getRange(1, 3));
  l.setAll(2, l.getRange(1, 4));
  l.setAll(0, l.getRange(2, 7));
}
