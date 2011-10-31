/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  If a generic type is used but the corresponding type arguments are not provided,
 * then the missing type arguments default to the unknown type (Dynamic).
 * @description Indirectly verifies the assertion: checks that various types are subtype of a type argument (which is
 * not provided), so it should be Dynamic.
 * @author iefremov
 */

class DynamicChecker<T> {
  DynamicChecker() {
    Expect.isTrue(new Object() is T);
    Expect.isTrue(1 is T);
    Expect.isTrue(func(){} is T);
    Expect.isTrue(int func(int x){} is T);
  }
}

main() {
  new DynamicChecker();
}