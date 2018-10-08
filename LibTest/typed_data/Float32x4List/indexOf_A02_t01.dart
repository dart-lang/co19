/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int indexOf(E element, [int start = 0])
 * @description Checks that if [startIndex] is out of bounds, it doesn't cause
 * any errors.
 * @note undocumented
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var l = new Float32x4List.fromList(
      [pack(-1.0), pack(0.0), pack(0.0), pack(-1.0), pack(2.0)]);
  Expect.equals(-1, l.indexOf(pack(-1.0), -1));
  Expect.equals(-1, l.indexOf(pack(0.0), -100000));
  Expect.equals(-1, l.indexOf(pack(2.0), 1000));
}
