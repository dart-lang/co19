/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  If a generic type is used but the corresponding type arguments are not provided,
 * then the missing type arguments default to the unknown type (Dynamic).
 * @description Indirectly verifies the assertion: checks that various unrelated types are subtypes 
 * of a type argument that wasn't provided (which makes it Dynamic).
 * @author iefremov
 * @reviewer rodionov
 * @needsreview The same works for Object. TODO: invent another way to test this.
 */

class DynamicChecker<S, T> {
  DynamicChecker() {
    var foo;
    Expect.isTrue(foo is S);
    Expect.isTrue(new Object() is S);
    Expect.isTrue(1 is S);
    Expect.isTrue(func() {} is S);
    Expect.isTrue(int func(int x) {} is S);

    Expect.isTrue(foo is T);
    Expect.isTrue(new Object() is T);
    Expect.isTrue(1 is T);
    Expect.isTrue(func() {} is T);
    Expect.isTrue(int func(int x) {} is T);
  }
}

main() {
  new DynamicChecker();
}