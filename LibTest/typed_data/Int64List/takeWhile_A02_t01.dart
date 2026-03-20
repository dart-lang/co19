// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Iterable<E> takeWhile(bool test(E value))
/// Creates a lazy iterable of the leading elements satisfying `test`.
///
/// The filtering happens lazily. Every new iterator of the returned iterable
/// starts iterating over the elements of this.
///
/// The elements can be computed by stepping through [iterator] until an element
/// is found where `test(element)` is false. At that point, the returned
/// iterable stops (its `moveNext()` returns `false`).
///
/// @description Checks that [test] is not invoked until returned [Iterable] is
/// not iterated.
/// @author msyabro

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  bool test(int e) {
    ++count;
    return true;
  }

  var list = new Int64List.fromList([1, 2, 3]);
  var res = list.takeWhile(test);
  Expect.equals(0, count);
  res.elementAt(0);
  Expect.equals(1, count);
}
