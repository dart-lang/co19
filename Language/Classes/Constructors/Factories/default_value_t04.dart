// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is not an error if redirecting factory
/// constructor has optional parameters with no defaults and that actual
/// arguments are passed as expected.
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

List expect = [];

test(x, y) {
  Expect.listEquals(expect, [x, y]);
}

enum E {
  e1, e2, e3;
  const E();

  factory E.f1(int x, [int y = 0]) {
    test(x, y);
    return E.e1;
  }
  factory E.f2(int x, {int y = 0}) {
    test(x, y);
    return E.e2;
  }
  factory E.f3(int x, {required int y}) {
    test(x, y);
    return E.e3;
  }

  factory E.fr1(int x, [int y]) = E.f1;
  factory E.fr2(int x, {int y}) = E.f2;
  factory E.fr3(int x, {required int y}) = E.f3;
}

main() {
  expect = [1, 0];
  E.fr1(1);
  expect = [1, 2];
  E.fr1(1, 2);

  expect = [1, 0];
  E.fr2(1);
  expect = [1, 2];
  E.fr2(1, y: 2);

  expect = [1, 2];
  E.fr3(1, y: 2);
}
