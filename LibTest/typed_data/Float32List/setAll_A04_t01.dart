// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void setAll(int index, Iterable<E> iterable)
/// ...
/// If iterable is based on this list, its values may change during the setAll
/// operation.
///
/// @description Checks that iterable values may change during the `setAll`
/// operation, if iterable is based on this list.
/// @author sgrekhov22@gmail.com

import "dart:typed_data";
import "../../../Utils/expect.dart";

listEquals(List<double> expected, List<double> actual) {
  Expect.equals(expected.length, actual.length);
  for (int i = 0; i < expected.length; i++) {
    Expect.approxEquals(expected[i], actual[i]);
  }
}

main() {
  var list = [0.1, 1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1];
  var l = new Float32List.fromList(list);
  var buffer = l.buffer;
  var iterable = Float32List.view(buffer, 8, 4);

  for (int i = 0; i < iterable.length; ++i) {
    Expect.approxEquals(list[i + 2], iterable[i]);
  }

  l.setAll(1, iterable);
  listEquals([0.1, 2.1, 3.1, 4.1, 5.1, 5.1, 6.1, 7.1, 8.1, 9.1], l);

  l.setAll(4, iterable);
  listEquals([0.1, 2.1, 3.1, 4.1, 3.1, 4.1, 5.1, 5.1, 8.1, 9.1], l);

  for (int i = 0; i < iterable.length; ++i) {
    Expect.notEquals(list[i + 2], iterable[i]);
  }
}
