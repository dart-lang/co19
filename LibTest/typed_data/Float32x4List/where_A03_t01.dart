// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Iterable<E> where(bool test(E element))
/// ...
/// Iterating multiple times over the returned [Iterable]
/// will invoke the supplied function [test] multiple times on the same element.
/// @description Checks that iterating multiple times over the returned
/// [Iterable] will invoke the supplied function [test] multiple times on the
/// same element.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var count = 0;
  test(e) {
    ++count;
    return true;
  }

  var list = new Float32x4List.fromList([pack(1.0), pack(2.0), pack(3.0)]);
  var res = list.where(test);

  res.elementAt(0);
  Expect.equals(1,count);

  res.elementAt(0);
  Expect.equals(2,count);

  res.elementAt(1);
  Expect.equals(4,count);

  res.elementAt(2);
  Expect.equals(7,count);
}
