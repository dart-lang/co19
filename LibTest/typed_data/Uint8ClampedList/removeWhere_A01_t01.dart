// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void removeWhere(bool test(E element))
/// Removes all elements of this list that satisfy test.
/// Throws an UnsupportedError if this is a fixed-length list.
/// @description Checks that [UnsupportedError] is thrown since
/// [Uint8ClampedList] is a fixed-length list.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Uint8ClampedList.fromList(list);
  var length = l.length;
  Expect.throws(
          () { l.removeWhere((e) => false); }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);

  Expect.throws(
          () { l.removeWhere((e) => true); }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5]);
}
