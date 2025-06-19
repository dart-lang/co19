// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E elementAt(int index)
/// ...
/// The index must be non-negative and less than length.
/// @description Checks that an error is thrown if `index < 0` or
/// `index >= length`.
/// @author msyabro

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(length) {
  var l = new Int8List(length);
  Expect.throws(() {
    l.elementAt(length);
  });
  Expect.throws(() {
    l.elementAt(length + 1);
  });
  Expect.throws(() {
    l.elementAt(-1);
  });
}

main() {
  check(0);
  check(1);
  check(100);
  check(65536);
}
