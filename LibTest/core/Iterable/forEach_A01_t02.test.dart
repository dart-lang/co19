/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function f to each element of this collection in iteration order.
 * @description Checks that no exception is thrown if the list is empty.
 * @author iefremov
 */
library forEach_A01_t02;

test(Iterable create([Iterable content])) {
  create([]).forEach(null);
  create([]).forEach((var v){});
}
