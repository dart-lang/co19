/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E single
 * Checks that this iterable has only one element, and returns that element.
 * @description Checks that [single] is read-only and can't be set.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  dynamic obj = new Float64x2List.fromList([f64x2(1.0)]);

  try {
    obj.single = f64x2(2.0);
    Expect.fail("[single] shou;d be read-only");
  } on NoSuchMethodError {}
}
