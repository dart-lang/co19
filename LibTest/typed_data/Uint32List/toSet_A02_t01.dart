/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> toSet()
 * ...
 * The set may contain fewer elements than the iterable, if the iterable
 * contains an element more than once, or it contains one or more elements that
 * are equal.
 * @description Checks that the set may contain fewer elements than the
 * iterable, if iterable contains elements that are equal.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Uint32List.fromList([1, 2, 3, 4, 5, 6]);
  var res = l.toSet();
  Expect.equals(6, res.length);

  l = new Uint32List.fromList([1, 5, 3, 6, 5, 6]);
  res = l.toSet();
  Expect.equals(4, res.length);
}
