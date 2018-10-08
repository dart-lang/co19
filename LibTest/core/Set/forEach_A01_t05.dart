/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(T element))
 * Applies the function [f] to each element of the collection.
 * @description Checks that invoking forEach() doesn't change the set by itself.
 * @author msyabro
 */
library forEach_A01_t05;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();
  s.addAll([1, 2, 3, 4, 5]);

  int i = 0;
  s.forEach((var x) {
    i++;
  });

  Expect.isTrue(s.containsAll([1, 2, 3, 4, 5]));
  Expect.isTrue(s.length == 5);
}

main() {
  test(create);
}
