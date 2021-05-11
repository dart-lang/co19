// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E lastWhere(bool test(E element), {E orElse()})
/// ...
/// If orElse is omitted, it defaults to throwing a StateError.
/// By default, when orElse is null, a [StateError] is thrown.
/// @description Checks that a [StateError] is thrown if thereis no element
/// satisfied [test] and [orElse] ia omitted.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Uint8ClampedList.fromList(list);
  Expect.throws(
          () { l.lastWhere((e) => false); }, (e) => e is StateError);
}

main() {
  check([]);
  check([0]);
  check([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
}
