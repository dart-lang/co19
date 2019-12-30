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
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class A {}

class C {
  static String staticTest1(int i, {String y = "", required String x}) => x;
  static String staticTest2(int i, {String y = "", required final x}) => x;
  String instanceTest1(int i, {String y = "", required String x}) => x;
  A instanceTest2(int i, {String y = "", required covariant A x}) => x;
  String instanceTest3(int i, {String y = "", required final x}) => x;
}

String test1(int i, {String y = "", required String x}) => x;

typedef String Foo(int i, {String y, required String x});

Foo test2 = (int i, {String y = "", required String x}) => x;

Function test3 = (int i, {String y = "", required String x}) => x;

String test4(int i, {String y = "", required final x}) => x;

main() {
  A a = new A();
  Expect.equals("Show must go on", C.staticTest1(42, x: "Show must go on"));
  Expect.equals("Lily was here", C.staticTest2(42, x: "Lily was here"));
  Expect.equals("Let it be", C().instanceTest1(42, x: "Let it be"));
  Expect.equals(a, C().instanceTest2(42, x: a));
  Expect.equals("No woman no cry", C().instanceTest3(42, x: "No woman no cry"));
  Expect.equals("I can't get no",  test1(42, x: "I can't get no"));
  Expect.equals("I can't get no",  test2(42, x: "I can't get no"));
  Expect.equals("I can't get no",  test3(42, x: "I can't get no"));
  Expect.equals("I can't get no",  test4(42, x: "I can't get no"));
}
