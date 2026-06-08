// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A late-uninitialized getter is a getter `g` which is implicitly
/// induced by a non-local variable `v` that does not have an initializing
/// expression. An invocation of `g` proceeds as follows: If the variable `v`
/// has not been bound to an object then a dynamic error occurs. If `v` has been
/// bound to an object `o′` then the invocation of `g` completes immediately,
/// returning `o′`.
/// ...
/// Case ⟨Late, uninitialized instance variable⟩. If `d` declares an instance
/// variable `id` which has the modifier `late` and does not have an
/// initializing expression, the implicitly induced getter of `id` is a
/// late-uninitialized getter. This determines the semantics of an invocation.
///
/// @description Checks that if `d` declares an instance variable `id` without
/// an initializing expression and has the modifier `late` it is a dynamic error
/// if `v` has not been bound to an object.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

class C {
  late final int v;
}

mixin M {
  late final int v;
}

class MA = Object with M;

void main() {
  C c = C();
  Expect.throws(() {
    c.v = (() {
      print(c.v);
      return 42;
    })();
  });

  M m = MA();
  Expect.throws(() {
    m.v = (() {
      print(m.v);
      return 42;
    })();
  });
}
