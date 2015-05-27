/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int offsetInBytes
 * Returns the offset in bytes into the underlying byte buffer of this view.
 * @description Checks that [offsetInBytes] is final and can't be set
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

pack(v) => new Float32x4.splat(v);

void check(array) {
  var l = new Float32x4List.fromList(array);
  try {
    l.offsetInBytes = 0;
    Expect.fail("[offsetInBytes] should be final");
  } on NoSuchMethodError catch(ok) {}
}

main() {
  check([]);
  check([pack(1.0)]);
  check(new Float32x4List(100));
}
