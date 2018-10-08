/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(T element))
 * Applies the function [f] to each element of the collection.
 * @description Checks that forEach() can be invoked on an empty set without any
 * errors.
 * @author pagolubev
 */
library forEach_A01_t02;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();

  int i = 0;
  void foo(var x) {
    i++;
  }
  s.forEach(foo);

  Expect.isTrue(i == 0);
}

main() {
  test(create);
}
