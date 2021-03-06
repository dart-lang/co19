// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void replaceRange(int start, int end, Iterable<E> replacement)
/// Removes the objects in the range start inclusive to end exclusive and
/// inserts the contents of replacement in its place.
/// ...
/// This method does not work on fixed-length lists, even when replacement has
/// the same number of elements as the replaced range.
/// @description Checks that [UnsupportedError] is thrown since [Float64List] is
/// a fixed-length list.
/// @note undocumented
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list) {
  var l = new Float64List.fromList(list);
  var length = l.length;
  Expect.throws(() {
    l.replaceRange(0, 1, [0.0]);
  }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);

  Expect.throws(() {
    l.replaceRange(0, 100, [0.0, 1.0, 2.0]);
  }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([1.0]);
  check([1.0, 2.0, 3.0, 4.0, 5.0]);
}
