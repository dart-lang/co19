/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int lastIndexOf(E element, [int start])
 * @description Checks that if [start] is out of bounds, it doesn't cause any
 * errors.
 * @note undocumented
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var l = new Float32x4List.fromList(
      [pack(-1.0), pack(0.0), pack(0.0), pack(-1.0), pack(2.0)]);
  Expect.equals(-1, l.lastIndexOf(pack(-1.0), -1));
  Expect.equals(-1, l.lastIndexOf(pack(0.0), -100000));
  Expect.equals(-1, l.lastIndexOf(pack(2.0), 1000));
}
