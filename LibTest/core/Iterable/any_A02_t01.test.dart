/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Checks whether any element of this iterable satisfies test.
 * Checks every element in iteration order, and returns true if any of them make
 * test return true, otherwise returns false.
 * @description Checks that exception thrown in [test] breaks the iteration.
 * @author msyabro
 */
library any_A02_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  int count = 0;
  try {
     create([1, 2]).any((var element) {
      throw ++count;
    });
  } on int {
    Expect.equals(1, count);
  }
  
  count = 0;
  try {
     create([1, 2, 3, 4, 5]).any((var element) {
      throw ++count;
    });
  } on int {
    Expect.equals(1, count);
  }
}
