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
/// @author sgrekhov@unipro.ru

import '../../../Utils/expect.dart';

class C {
  const C();
  static void stat1() {}
  static void stat2() {}
}

extension Ext on C {
  static void estat1() {}
  static void estat2() {}
}

mixin M on C {
  static void mstat1() {}
  static void mstat2() {}
}

class D extends C {
  const D();
  static void stat1() {}
}

void foo() {}
void bar() {}

main() {
  const e1 = foo;
  const e2 = foo;
  Expect.identical(e1, e2);

  const e3 = bar;
  Expect.notEquals(e3, e1);

  const e4 = C.stat1;
  const e5 = C.stat1;
  Expect.identical(e4, e5);
  Expect.notEquals(e1, e4);

  const e6 = C.stat2;
  Expect.notEquals(e4, e6);

  const e7 = Ext.estat1;
  const e8 = Ext.estat1;
  Expect.identical(e7, e8);
  Expect.notEquals(e7, e1);
  Expect.notEquals(e7, e4);

  const e9 = Ext.estat2;
  Expect.notEquals(e9, e7);
  Expect.notEquals(e9, e4);
  Expect.notEquals(e9, e1);

  const e10 = D.stat1;
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
