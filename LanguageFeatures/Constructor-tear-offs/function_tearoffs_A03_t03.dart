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

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

typedef IntAlias = int;

class C {
  const C();
  static X stat<X>(X x) => x;
}

mixin M on C {
  static X mstat<X>(X x) => x;
}

extension Ext on C {
  static X estat<X>(X x) => x;
}

X foo<X>(X x) => x;

main() {
  const e1 = foo<int>;
  const e2 = foo<IntAlias>;
  const CheckIdentical(e1, e2);

  const e4 = C.stat<int>;
  const e5 = C.stat<IntAlias>;
  const CheckIdentical(e4, e5);
  Expect.notEquals(e2, e4);

  const e7 = Ext.estat<int>;
  const e8 = Ext.estat<IntAlias>;
  const CheckIdentical(e7, e8);
  Expect.notEquals(e7, e2);
  Expect.notEquals(e7, e5);

  const e9 = M.mstat<int>;
  const e10 = M.mstat<IntAlias>;
  const CheckIdentical(e9, e10);
  Expect.notEquals(e9, e2);
  Expect.notEquals(e9, e5);
  Expect.notEquals(e9, e8);
}
