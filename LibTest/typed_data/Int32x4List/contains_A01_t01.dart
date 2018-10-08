/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * Returns true if the collection contains an element equal to element.
 * This operation will check each element in order for being equal to element,
 * unless it has a more efficient way to find an element equal to element.
 * The equality used to determine whether element is equal to an element of the
 * iterable defaults to the Object.== of the element.
 * @description Checks that true is returned if there is an element in this list
 * equal to element, false otherwise.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var l = new Int32x4List.fromList([]);
  Expect.isFalse(l.contains([]));
  Expect.isFalse(l.contains(i32x4(0)));
  Expect.isFalse(l.contains(0));
  Expect.isFalse(l.contains(new Object()));

  var el = i32x4(1);
  l = new Int32x4List.fromList([el]);
  Expect.isFalse(l.contains(el));
  Expect.isFalse(l.contains([]));
  Expect.isFalse(l.contains(i32x4(1)));
  Expect.isFalse(l.contains(1));
  Expect.isFalse(l.contains(new Object()));
}
