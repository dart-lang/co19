/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * ...
 * The list is fixed-length if [growable] is false.
 * @description Checks that the returned list is not fixed-length if [growable]
 * is true.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var list = new Uint16List.fromList([0]);
  var resList = list.toList(growable: true);

  resList.length = 2;
  Expect.equals(2, resList.length);
  resList.add(1);
  Expect.equals(3, resList.length);
  resList.addAll([1, 2, 3]);
  Expect.equals(6, resList.length);

  resList.removeLast();
  Expect.equals(5, resList.length);
  resList.clear();
  Expect.equals(0, resList.length);
}
