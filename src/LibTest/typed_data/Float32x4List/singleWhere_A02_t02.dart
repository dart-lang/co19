/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * If no or more than one element match then a [StateError] is thrown.
 * @description Checks that a [StateError] is thrown if more than one
 * element match [test].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

pack(v) => new Float32x4.splat(v);

main() {
  var l = new Float32x4List.fromList([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)]);
  try {
    l.singleWhere( (e) => true);
    Expect.fail("StateError is expected");
  } on StateError catch(ok) {}

  l = new Float32x4List.fromList([pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0)]);
  try {
    l.singleWhere( (e) => e.x != 0.0);
    Expect.fail("StateError is expected");
  } on StateError catch(ok) {}
}

