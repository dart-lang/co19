/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E element), {E orElse()})
 * ...
 * If orElse is omitted, it defaults to throwing a [StateError].
 * @description Checks that a [StateError] is thrown if no element satisfies
 * [test] and orElse is omitted.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 zero() => new Float32x4.zero();

check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  try {
    l.lastWhere((e) => false);
    Expect.fail("StateError is expected");
  } on StateError {}
}

main() {
  check([]);
  check([zero()]);
  check([
    zero(), zero(), zero(), zero(), zero(), zero(), zero(), zero(), zero(),
    zero(), zero(), zero(), zero(), zero()
  ]);
}
