/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the indexth element.
 * @description Checks that the indexth element is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  var l = new Float32x4List.fromList([
    pack(10.0), pack(20.0), pack(30.0), pack(40.0), pack(50.0), pack(60.0),
    pack(70.0), pack(80.0), pack(90.0), pack(100.0)
  ]);
  for (int i = 1; i <= 10; ++i) {
    Expect.equals(i * 10.0, l.elementAt(i - 1).x);
    Expect.equals(i * 10.0, l.elementAt(i - 1).y);
    Expect.equals(i * 10.0, l.elementAt(i - 1).z);
    Expect.equals(i * 10.0, l.elementAt(i - 1).w);
  }
}
