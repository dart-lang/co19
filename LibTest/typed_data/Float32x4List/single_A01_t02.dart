/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E single
 * Checks that this iterable has only one element, and returns that element.
 * @description Checks that [last] is read-only and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic l = new Float32x4List.fromList([new Float32x4.zero()]);
  try {
    l.single = new Float32x4.splat(.1);
    Expect.fail("[single] should be read-only");
  } on NoSuchMethodError {}
}
