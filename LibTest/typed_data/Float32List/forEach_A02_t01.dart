/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function f to each element of this collection in iteration order.
 * @description Checks that elements are passed to the function [f] in
 * iteration order.
 * @author a.semenov@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  List<double> data = [1.0, 2.1, 3.2, 4.3, 5.4, 6.5, 7.6, 8.7, 9.8, 10.9];
  Float32List list = new Float32List.fromList(data);

  Iterator<double> expected = list.iterator;
  list.forEach((e) {
    Expect.isTrue(expected.moveNext());
    Expect.equals(expected.current, e);
  });
  Expect.isFalse(expected.moveNext());
}
