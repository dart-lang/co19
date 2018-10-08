/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void sort([int compare(E a, E b) ])
 * ...
 * The default List implementations use Comparable.compare if compare is
 * omitted.
 * @description Checks that it is a error if compare is omitted, as Float64x2
 * has no instance method 'compareTo'.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var l = new Float64x2List.fromList([f64x2(2.0), f64x2(1.0)]);
  Expect.throws (() {
    l.sort();
  });
}
