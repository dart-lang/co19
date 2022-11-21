// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void clear()
/// Removes all objects in the list; the length of the list becomes zero.
/// Throws an [UnsupportedError], and retains all elements, if the length of the
/// list is a fixed-length list.
/// @description Checks that an [UnsupportedError] is thrown since [Uint64List]
/// is a fixed-length list.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(length) {
  var l = new Uint64List(length);
  Expect.throws(() { l.clear(); }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);
}

main() {
  check(0);
  check(1);
  check(100);
  check(2048);
}
