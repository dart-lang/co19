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
 * the 'required' modifier. Test when required named parameter is not the first
 * one
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class A {}

class C {
  static String test1(int x, {String z, required String y}) => y;
  String test2(int x, {String z, required String y}) => y;

  A test4(int x, {String z, required covariant A y}) => y;
}

String test5(int x, {String z, required String y}) => y;

typedef String Foo(int x, {String z, required String y});

Foo test6 = (int x, {String z, required String y}) => y;

Function test7 = (int x, {String z, required String y}) => y;

main() {
  A a = new A();
  Expect.equals("Love me tender", C.test1(3, y: "Love me tender"));
  Expect.equals("love me sweet", C().test2(1, y: "love me sweet", z: ""));
  Expect.equals(a, C().test4(1, y: a, z: ""));
  Expect.equals("never let me go", test5(1, y: "never let me go"));
  Expect.equals("You have made my life complete",
      test6(5, y: "You have made my life complete", z: ""));
  Expect.equals("and I love you so", test7(9, y: "and I love you so"));
}
