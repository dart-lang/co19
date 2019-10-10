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
 * the 'required' modifier. Test one named required parameter
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class A {}

class C {
  static String test1({required String x}) => x;
  String test2({required String x}) => x;
  A test4({required covariant A x}) => x;
}

String test5({required String x}) => x;

typedef String Foo({required String x});

Foo test6 = ({required String x}) => x;

Function test7 = ({required String x}) => x;

main() {
  A a = new A();
  Expect.equals("Love me tender", C.test1(x: "Love me tender"));
  Expect.equals("love me sweet", C().test2(x: "love me sweet"));
  Expect.equals(a, C().test4(x: a));
  Expect.equals("never let me go", test5(x: "never let me go"));
  Expect.equals("You have made my life complete",
      test6(x: "You have made my life complete"));
  Expect.equals("and I love you so", test7(x: "and I love you so"));
}
