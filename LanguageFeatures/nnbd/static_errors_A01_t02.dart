// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to call a method, setter, getter or operator on an
/// expression whose type is potentially nullable and not `dynamic`, except for
/// the methods, setters, getters, and operators on `Object`, and except when
/// said member is an extension member or the receiver type is an extension type
///
/// @description Check that it is no compile-time error to call a method, setter,
/// getter or operator on an expression whose type is potentially nullable if
/// they are methods, setters, getters, and operators on `Object`.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class A {}

mixin class M {}

enum E {
  e0;
}

extension type ET(int _) {}

main() {
  A? a = 2 > 1 ? A() : null;
  M? m = 2 > 1 ? M() : null;
  E? e = 2 > 1 ? E.e0 : null;
  ET? et = 2 > 1 ? ET(0) : null;
  final inv = Invocation.method(Symbol('foo'), []);

  Expect.isNotNull(a.hashCode);
  Expect.isNotNull(a.toString());
  Expect.isNotNull(a.runtimeType);
  Expect.isFalse(a == A());
  Expect.throws((){
    a.noSuchMethod(inv);
  });

  Expect.isNotNull(m.hashCode);
  Expect.isNotNull(m.toString());
  Expect.isNotNull(m.runtimeType);
  Expect.isFalse(m == M());
  Expect.throws((){
    m.noSuchMethod(inv);
  });

  Expect.isNotNull(e.hashCode);
  Expect.isNotNull(e.toString());
  Expect.isNotNull(e.runtimeType);
  Expect.isTrue(e == E.e0);
  Expect.throws((){
    e.noSuchMethod(inv);
  });

  Expect.isNotNull(et.hashCode);
  Expect.isNotNull(et.toString());
  Expect.isNotNull(et.runtimeType);
  Expect.isTrue(et == ET(0));
  Expect.throws((){
    et.noSuchMethod(inv);
  });
}
