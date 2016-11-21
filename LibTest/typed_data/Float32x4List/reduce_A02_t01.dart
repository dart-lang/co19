/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E previousValue, E element))
 * If [this] is empty, a [StateError] is thrown.
 * @description Checks that a [StateError] is thrown.
 * @note undocumented
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  Float32x4List l = new Float32x4List.fromList([]);
  try {
    l.reduce((prev, cur) => pack(0.0));
    Expect.fail("StateError is expected");
  } on StateError catch(ok) {}
}
