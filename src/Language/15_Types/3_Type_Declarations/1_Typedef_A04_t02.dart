/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a type annotation is omitted on a formal parameter in typedef declaration, it is taken to be dynamic.
 * @description Checks that function types with various types of formal optional parameter and named parameter
 * are subtypes of given type t1 whose declaration omits parameter types, therefore the type of formal parameter
 * of t1 should be dynamic.
 * @static-clean
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

typedef f1([x]);
typedef f2({x});

typedef func();
typedef int func2(int x);

main() {
  Expect.isTrue(([int x]){} is f1);
  Expect.isTrue(([Object x]){} is f1);
  Expect.isTrue(([func x]){} is f1);
  Expect.isTrue(([func2 x]){} is f1);

  Expect.isTrue(({int x}){} is f2);
  Expect.isTrue(({Object x}){} is f2);
  Expect.isTrue(({func x}){} is f2);
  Expect.isTrue(({func2 x}){} is f2);
}
