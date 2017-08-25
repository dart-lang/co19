/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterator<E> iterator
 * Returns a new Iterator that allows iterating the elements of this Iterable.
 * @description Checks that iterator is read-only and cannot be set.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic obj = new Float64x2List(0);
  try {
    obj.iterator = obj.iterator;
    Expect.fail("[iterator] should be read-only");
  } on NoSuchMethodError {}
}
