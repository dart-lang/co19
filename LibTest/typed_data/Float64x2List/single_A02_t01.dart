/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E single
 * ...
 * Throws a StateError if this is empty or has more than one element.
 * @description Checks that a StateError is thrown if this is empty.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float64x2List.fromList([]);
  try {
    l.single;
    Expect.fail("StateError is expected");
  } on StateError {}
}
