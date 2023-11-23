// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e1 and e2 be two constant expressions that both evaluate to a
/// function object which is obtained by generic function instantiation of the
/// same function declaration and with the same type arguments. In this case
/// identical(e1, e2) shall evaluate to true.
/// That is, constant expressions whose evaluation is a generic function
/// instantiation are canonicalized.
///
/// @description Checks that if e1 and e2 are two constant expressions that both
/// evaluate to a function object which is obtained by generic function
/// instantiation of the same function declaration and with the same type
/// arguments, then identical(e1, e2) evaluates to true
/// @author sgrekhov@unipro.ru

import '../../../Utils/expect.dart';

class C {
  const C();
  static X stat1<X>(X x) => x;
  static Y stat2<Y>(Y y) => y;
}

extension Ext on C {
  static X estat1<X>(X x) => x;
  static Y estat2<Y>(Y y) => y;
}

mixin M on C {
  static X mstat1<X>(X x) => x;
  static Y mstat2<Y>(Y y) => y;
}

class D extends C {
  const D();
  static X stat1<X>(X x) => x;
}

X foo<X>(X x) => x;
Y bar<Y>(Y y) => y;

typedef int Func(int i);

main() {
  const Func e1 = foo;
  const Func e2 = foo;
  Expect.identical(e1, e2);

  const Func e3 = bar;
  Expect.notEquals(e3, e1);

  const Func e4 = C.stat1;
  const Func e5 = C.stat1;
  Expect.identical(e4, e5);
  Expect.notEquals(e1, e4);

  const Func e6 = C.stat2;
  Expect.notEquals(e4, e6);

  const Func e7 = Ext.estat1;
  const Func e8 = Ext.estat1;
  Expect.identical(e7, e8);
  Expect.notEquals(e7, e1);
  Expect.notEquals(e7, e4);

  const Func e9 = Ext.estat2;
  Expect.notEquals(e9, e7);
  Expect.notEquals(e9, e4);
  Expect.notEquals(e9, e1);

  const Func e10 = D.stat1;
  Expect.notEquals(e10, e4);

  const e11 = M.mstat1;
  const e12 = M.mstat1;
  Expect.identical(e11, e12);
  Expect.notEquals(e11, e7);
  Expect.notEquals(e11, e4);
  Expect.notEquals(e11, e1);

  const e13 = M.mstat2;
  Expect.notEquals(e11, e13);
}
