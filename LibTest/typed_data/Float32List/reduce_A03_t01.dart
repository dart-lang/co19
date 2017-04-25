/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * ...
 * If iterable has only one element, that element is returned.
 * @description Checks that if iterable has only one element, that element is
 * returned
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  List<double> ld = [2.0];
  var l = new Float32List.fromList(ld);
  var res = l.reduce((prev, cur) => prev + cur + 1);
  Expect.equals(2.0, res);

  res = l.reduce((prev, cur) => 1.0);
  Expect.equals(2.0, res);
}
