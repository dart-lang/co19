/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int indexOf(E element, [int start = 0])
 * ...
 * Returns -1 if element is not found.
 * @description Checks that the correct index is returned, if the element
 * is not present.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var l = new Float32x4List.fromList(
      [pack(-1.0), pack(0.0), pack(0.0), pack(-1.0), pack(2.0)]);
  Expect.equals(-1, l.indexOf(pack(5.0), 0));
  Expect.equals(-1, l.indexOf(pack(5.0), 4));
  Expect.equals(-1, l.indexOf(pack(0.0), 3));
  Expect.equals(-1, l.indexOf(pack(-1.0), 4));
  Expect.equals(-1, l.indexOf(pack(-1.0), 0));
}
