/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * Returns true if the collection contains an element equal to element.
 * ...
 * The equality used to determine whether element is equal to an element of the
 * iterable defaults to the Object.== of the element.
 * @description Checks that contains return false if the elements are not equal.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  var element = f64x2(1.0);
  var list = [element];
  var l = new Float64x2List.fromList(list);
  Expect.isFalse(l.contains(l.elementAt(0)));
  Expect.isFalse(l.contains(l[0]));
  Expect.isFalse(l.contains(element));
  Expect.isFalse(l.contains(f64x2(1.0)));
}
