// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that C<X1 extends B1 . . . , Xm extends Bm> is the name
/// and formal type parameters of the enclosing class, const? is const or empty,
/// N is C or C.id0 for some identifier id0, and id is an identifier, then
/// consider a declaration of a redirecting factory constructor k of one of the
/// forms
/// const? factory
///     N(T1 x1 . . . , Tn xn, [Tn+1 xn+1=d1, . . . , Tn+k xn+k=dk]) = R;
/// const? factory
///     N(T1 x1 . . . , Tn xn, {Tn+1 xn+1=d1, . . . , Tn+k xn+k=dk}) = R;
/// where R is of one of the forms T<S1 . . . , Sp> or T<S1 . . . , Sp>.id.
/// ...
/// It is a compile-time error if k explicitly specifies a default value for an
/// optional parameter.
///
/// @description Checks that it is not an error if a redirecting factory
/// constructor has optional parameters with no defaults and that actual
/// arguments are passed as expected.
/// @author ilya

import "../../../../Utils/expect.dart";

List expect = [];

test(x, y) {
  Expect.listEquals(expect, [x, y]);
}

class F {
  factory F(int x, [int y]) = C;
  factory F.foo(int x, [int y]) = C.foo;
  factory F.bar(int x, {int y}) = C.bar;
  factory F.baz(int x, {required int y}) = C.baz;
}

class C implements F {
  C(int x, [int y = 0]) {
    test(x, y);
  }
  C.foo(int x, [int y = 0]) {
    test(x, y);
  }
  C.bar(int x, {int y = 0}) {
    test(x, y);
  }
  C.baz(int x, {required int y}) {
    test(x, y);
  }
}

main() {
  expect = [1, 0];
  new F(1);
  expect = [1, 1];
  new F(1, 1);
  expect = [1, 0];
  new F.foo(1);
  expect = [1, 1];
  new F.foo(1, 1);
  expect = [1, 0];
  new F.bar(1);
  expect = [1, 1];
  new F.bar(1, y: 1);
  expect = [2, 2];
  new F.baz(2, y: 2);
}
