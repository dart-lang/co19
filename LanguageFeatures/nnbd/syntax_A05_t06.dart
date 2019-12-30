/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The modifier required is added as a built-in identifier. The
 * grammar of function types is extended to allow any named parameter
 * declaration to be prefixed by the required modifier (e.g. int Function(int,
 * {int? y, required int z}).
 *
 * @description Check that any named parameter declaration can be prefixed by
 * the 'required' modifier. Test one named required parameter and nullable
 * argument
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class A {}

class C {
  static String? staticTest1({required String? x}) => x;
  String? instanceTest1({required String? x}) => x;
  A? instanceTest2({required covariant A? x}) => x;
}

String? test1({required String? x}) => x;

typedef String? Foo({required String? x});

Foo test2 = ({required String? x}) => x;

Function test3 = ({required String? x}) => x;

main() {
  A? a = new A();
  Expect.equals("Show must go on", C.staticTest1(x: "Show must go on"));
  Expect.equals("Let it be", C().instanceTest1(x: "Let it be"));
  Expect.equals(a, C().instanceTest2(x: a));
  Expect.equals("I can't get no",  test1(x: "I can't get no"));
  Expect.equals("I can't get no",  test2(x: "I can't get no"));
  Expect.equals("I can't get no",  test3(x: "I can't get no"));
}
