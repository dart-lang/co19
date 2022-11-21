// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E removeAt(int index)
/// Removes the object at position index from the list.
/// ...
/// Throws an UnsupportedError if this is a fixed-length list. In that case the
/// list is not modified.
/// @description Checks that [UnsupportedError] is thrown since [Uint64List] is
/// a fixed-length list.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Uint64List.fromList(list);
  var length = l.length;
  Expect.throws(() { l.removeAt(0); }, (e) => e is UnsupportedError);
  Expect.equals(length, l.length);
}

main() {
  check([]);
  check([1]);
  check([1, 2, 3, 4, 5]);
}
