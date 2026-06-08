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
///
/// Case ⟨Static or library variable⟩. If `d` declares a static or
/// library variable, the implicitly induced getter of `id` executes as follows:
/// - Non-constant variable with an initializer. In the case where `d` has an
///   initializing expression and is not constant, the implicitly induced getter
///   of `id` is a late-initialized getter. This determines the semantics of an
///   invocation.
///
/// @description Checks that if the evaluation of `e` throws then the invocation
/// of `g` completes throwing the same object and does not change the binding of
/// `v`.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

int count = 0;

int v1 = f();
final int v2 = f();

int f() {
  if (count++ == 0) {
    throw 42;
  }
  return 0;
}

class C {
  static int v1 = f();
  static final int v2 = f();
}

mixin M {
  static int v1 = f();
  static final int v2 = f();
}

enum E {
  e0;
  static int v1 = f();
  static final int v2 = f();
}

class A {}

extension Ext on A {
  static int v1 = f();
  static final int v2 = f();
}

extension type ET(int _) {
  static int v1 = f();
  static final int v2 = f();
}

main() {
  try {
    v1;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, v1);
  }
  count = 0;
  try {
    v2;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, v2);
  }

  count = 0;
  try {
    C.v1;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, C.v1);
  }
  count = 0;
  try {
    C.v2;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, C.v2);
  }

  count = 0;
  try {
    M.v1;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, M.v1);
  }
  count = 0;
  try {
    M.v2;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, M.v2);
  }

  count = 0;
  try {
    E.v1;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, E.v1);
  }
  count = 0;
  try {
    E.v2;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, E.v2);
  }

  count = 0;
  try {
    Ext.v1;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, Ext.v1);
  }
  count = 0;
  try {
    Ext.v2;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, Ext.v2);
  }

  count = 0;
  try {
    ET.v1;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, ET.v1);
  }
  count = 0;
  try {
    ET.v2;
  } catch (e) {
    Expect.equals(42, e);
    Expect.equals(0, ET.v2);
  }
}
