/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function f to each element of this collection in iteration order.
 * @description Checks that no exception is thrown if the list is empty.
 * @static-warning
 * @author iefremov
 * @reviewer pagolubev
 */
library forEach_A01_t02;
import "../../../Utils/dynamic_check.dart";

test(Iterable create([Iterable content])) {
  create([]).forEach(null);
  create([]).forEach((var v){});

  if(isCheckedMode()) {
    return;
  }
  create([]).forEach(1); /// static type warning
  create([]).forEach(""); /// static type warning
  create([]).forEach(3.14); /// static type warning

  create(const []).forEach(1); /// static type warning
  create(const []).forEach(""); /// static type warning
  create(const []).forEach(3.14); /// static type warning
}
