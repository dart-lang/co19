// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to call a method, setter, getter or operator on an
/// expression whose type is potentially nullable and not `dynamic`, except for
/// the methods, setters, getters, and operators on `Object`, and except when
/// said member is an extension member or the receiver type is an extension type
///
/// @description  Check that it is no compile-time error to call a method,
/// setter, getter or operator on an extension type.
/// @author sgrekhov22@gmial.com

import "../../Utils/expect.dart";

extension type ET1(Object? v) {
  int foo() => 1;
  int get bar => 2;
  void set baz(int i) {}
  ET1 operator +(ET1 other) => other;
}

extension type ET2(Object v) implements Object {
  int foo() => 1;
  int get bar => 2;
  void set baz(int i) {}
  ET2 operator +(ET2 other) => other;
}

main() {
  final et1 = ET1(null);
  Expect.equals(1, et1.foo());
  Expect.equals(2, et1.bar);
  et1.baz = 3;
  et1 + et1;

  final et2 = ET2(0);
  Expect.equals(1, et2.foo());
  Expect.equals(2, et2.bar);
  et2.baz = 3;
  et2 + et2;
}
