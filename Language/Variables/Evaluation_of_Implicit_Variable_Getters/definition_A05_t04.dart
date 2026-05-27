// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A late-initialized getter is a getter `g` which is implicitly
/// induced by a non-local variable `v` that has an initializing expression `e`.
/// An invocation of g proceeds as follows:
/// If the variable `v` has not been bound to an object then `e` is evaluated to
/// an object `o`. If `v` has now been bound to an object, and `v` is `final`, a
/// dynamic error occurs. Otherwise, `v` is bound to `o`, and the evaluation of
/// `g` completes returning `o`. If the evaluation of `e` throws then the
/// invocation of `g` completes throwing the same object and stack trace, and
/// does not change the binding of `v`.
/// ...
/// Case ⟨Late, initialized instance variable⟩. If `d` declares an instance
/// variable `id` which has the modifier `late` and an initializing expression,
/// the implicitly induced getter of `id` is a late-initialized getter. This
/// determines the semantics of an invocation.
///
/// @description Checks that if the evaluation of `e` throws then the invocation
/// of `g` completes throwing the same object and does not change the binding of
/// `v`.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

int count = 0;

int f() {
  if (count++ == 0) {
    throw 42;
  }
  return 0;
}

class C {
  late int v1 = f();
  late final int v2 = f();
}

mixin M {
  late int v1 = f();
  late final int v2 = f();
}

class MA = Object with M;

main() {
  C c = C();
  try {
    c.v1;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, c.v1);
  }
  count = 0;
  try {
    c.v2;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, c.v2);
  }

  count = 0;
  M m = MA();
  try {
    m.v1;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, m.v1);
  }
  count = 0;
  try {
    m.v2;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, m.v2);
  }
}
