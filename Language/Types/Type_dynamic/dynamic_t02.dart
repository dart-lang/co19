/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a generic type is used but type arguments are not provided,
 * then the type arguments default to the unknown type.
 * @description Indirectly verifies the assertion: checks that various unrelated
 * types are subtypes of an omitted type argument.
 * @author iefremov
 * @reviewer rodionov
 * @note this test would also pass if such type arguments defaulted to Object
 * type. Object seems to be indistinguishable from dynamic as far as subtype
 * testing is concerned.
 */
import "../../../Utils/expect.dart";

class DynamicChecker<S, T> {
  DynamicChecker() {
    int func(int x) {}
    var foo;

    Expect.isTrue(foo is S);
    Expect.isTrue(new Object() is S);
    Expect.isTrue(1 is S);
    Expect.isTrue(() {} is S);
    Expect.isTrue(func is S);

    Expect.isTrue(foo is T);
    Expect.isTrue(new Object() is T);
    Expect.isTrue(1 is T);
    Expect.isTrue(() {} is T);
    Expect.isTrue(func is T);
  }
}

main() {
  new DynamicChecker();
}
