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
/// @description Checks that if `v` has already been bound to an object, and `v`
/// is  `final`, a dynamic error occurs.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

int count = 0;

late final int v = (() {
  if (count++ == 0) {
    print(v);
  }
  return 42;
})();

class C {
  static late final int v = (() {
    if (count++ == 0) {
      print(C.v);
    }
    return 42;
  })();
}

mixin M {
  static late final int v = (() {
    if (count++ == 0) {
      print(M.v);
    }
    return 42;
  })();
}

enum E {
  e0;
  static late final int v = (() {
    if (count++ == 0) {
      print(E.v);
    }
    return 42;
  })();
}

class A {}

extension Ext on A {
  static late final int v = (() {
    if (count++ == 0) {
      print(Ext.v);
    }
    return 42;
  })();
}

extension type ET(int _) {
  static late final int v = (() {
    if (count++ == 0) {
      print(ET.v);
    }
    return 42;
  })();
}

void main() {
  Expect.throws(() {
    v;
  });
  count = 0;
  Expect.throws(() {
    C.v;
  });
  count = 0;
  Expect.throws(() {
    M.v;
  });
  count = 0;
  Expect.throws(() {
    E.v;
  });
  count = 0;
  Expect.throws(() {
    Ext.v;
  });
  count = 0;
  Expect.throws(() {
    ET.v;
  });
}
