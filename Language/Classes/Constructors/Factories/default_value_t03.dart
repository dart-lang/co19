/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if k explicitly specifies a default
 * value for an optional parameter.
 * @description Checks that it is not an error if redirecting factory
 * constructor has optional parameters with no defaults and that actual
 * arguments are passed as expected.
 * @author ilya
 */
import "../../../../Utils/expect.dart";

List expect;

test(x,y) {
  Expect.listEquals(expect, [x,y]);
}

class F {
  factory F(int x, [int y]) = C;
  factory F.foo(int x, [int y]) = C.foo;
  factory F.bar(int x, {int y}) = C.bar;
}

class C implements F {
  C(int x, [int y]) { test(x,y); }
  C.foo(int x, [int y]) { test(x,y); }
  C.bar(int x, {int y}) { test(x,y); }
}

main() {
  expect = [1,null]; new F(1);
  expect = [1,1]; new F(1,1);
  expect = [1,null]; new F.foo(1);
  expect = [1,1]; new F.foo(1,1);
  expect = [1,null]; new F.bar(1);
  expect = [1,1]; new F.bar(1,y:1);
}
