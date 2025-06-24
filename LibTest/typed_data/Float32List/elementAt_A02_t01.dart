// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E elementAt(int index)
/// ...
/// The index must be non-negative and less than length. Index zero represents
/// the first element (so iterable.elementAt(0) is equivalent to iterable.first).
/// @description Checks that an error is thrown if [this] has fewer than
/// [index] elements.
/// @author msyabro

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(int length) {
  var l = new Float32List(length);
  Expect.throws(() {
    l.elementAt(length + 1);
  }, (e) => e is RangeError || e is IndexError);
  Expect.throws(() {
    l.elementAt(length);
  }, (e) => e is RangeError || e is IndexError);
  Expect.throws(() {
    l.elementAt(-1);
  }, (e) => e is RangeError || e is IndexError);
}

main() {
  check(0);
  check(1);
  check(100);
  check(65536);
}
