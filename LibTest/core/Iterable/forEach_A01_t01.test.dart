/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function f to each element of this collection in iteration order.
 * @description Checks that the function [f] is called for each element of the
 * list.
 * @author vasya
 * @author sgrekhov@unipro.ru
 */
library forEach_A01_t01;
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Iterable a = create([1, 2, 3, 4, 5, 6, 7]);
  List log = new List();

  void f(e) {
    log.add(e);
  }
  a.forEach(f);

  Expect.equals(a.length, log.length);

  for (var i = 0; i < a.length; i++) {
    Expect.equals(a.elementAt(i), log[i]);
  }
}
