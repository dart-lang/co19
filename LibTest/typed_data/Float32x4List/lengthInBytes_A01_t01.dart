/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int lengthInBytes
 * Returns the length of this view, in bytes.
 * @description Checks that the correct length is returned.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

O() => new Float32x4.zero();

void check(List<Float32x4> list) {
  var l = new Float32x4List.fromList(list);
  Expect.equals(list.length * Float32x4List.BYTES_PER_ELEMENT, l.lengthInBytes);
}

main() {
  check([]);
  check([O()]);
  check([O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
         O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
         O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
         O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(),
         O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O(), O()]);
}
