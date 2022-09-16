// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e1 and e2 be two constant expressions that both evaluate to a
/// function object which is obtained by function closurization of the same
/// function declaration. In this case identical(e1, e2) shall evaluate to true.
/// That is, constant expressions whose evaluation is a function closurization
/// are canonicalized.
///
/// @description Checks that if e1 and e2 are two constant expressions that both
/// evaluate to a function object which is obtained by function closurization of
/// the same function declaration, then identical(e1, e2) evaluates to true.
///
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {
  const C();
  static X stat1<X>(X x) => x;
  static Y stat2<Y>(Y y) => y;
}

mixin M on C {
  static X mstat1<X>(X x) => x;
  static Y mstat2<Y>(Y y) => y;
}

extension Ext on C {
  static X estat1<X>(X x) => x;
  static Y estat2<Y>(Y y) => y;
}

class D extends C {
  const D();
  static X stat1<X>(X x) => x;
}

X foo<X>(X x) => x;
Y bar<Y>(Y y) => y;

main() {
  const e1 = foo<int>;
  const e2 = foo<int>;
  const CheckIdentical(e1, e2);

  const e3 = bar<int>;
  Expect.notEquals(e3, e1);

  const e4 = C.stat1<int>;
  const e5 = C.stat1<int>;
  const CheckIdentical(e4, e5);
  Expect.notEquals(e1, e4);

  const e6 = C.stat2<int>;
  Expect.notEquals(e4, e6);

  const e7 = Ext.estat1<int>;
  const e8 = Ext.estat1<int>;
  const CheckIdentical(e7, e8);
  Expect.notEquals(e7, e1);
  Expect.notEquals(e7, e4);

  const e9 = Ext.estat2<int>;
  Expect.notEquals(e9, e7);
  Expect.notEquals(e9, e4);
  Expect.notEquals(e9, e1);

  const e10 = D.stat1<int>;
  Expect.notEquals(e10, e4);

  const e11 = M.mstat1<int>;
  const e12 = M.mstat1<int>;
  const CheckIdentical(e11, e12);
  Expect.notEquals(e7, e11);
  Expect.notEquals(e4, e11);
  Expect.notEquals(e1, e11);
}
