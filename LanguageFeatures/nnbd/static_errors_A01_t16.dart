// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to call a method, setter, getter or operator on an
/// expression whose type is potentially nullable and not `dynamic`, except for
/// the methods, setters, getters, and operators on `Object`, and except when
/// said member is an extension member or the receiver type is an extension type
///
/// @description  Check that it is no compile-time error to call a method,
/// setter, getter or operator on an expression whose type is potentially
/// nullable if they are methods, setters, getters, and operators on an
/// extension. Test an enum.
/// @author sgrekhov22@gmial.com

import "../../Utils/expect.dart";

enum E {
  e0;
}

extension on E? {
  int foo() => 1;
  int get bar => 2;
  void set baz(int i) {}
  E? operator +(E? other) => other;
}

class A<T extends E?> {
  T t;
  A(this.t);

  test() {
    Expect.equals(1, t.foo());
    Expect.equals(2, t.bar);
    t.baz = 3;
    t + t;
  }
}

main() {
  E? e = 2 > 1 ? E.e0 : null;
  Expect.equals(1, e.foo());
  Expect.equals(2, e.bar);
  e.baz = 3;
  e + e;

  A(null).test();
}
