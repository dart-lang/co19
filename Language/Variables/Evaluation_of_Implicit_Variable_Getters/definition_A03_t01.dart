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
/// Case ⟨Static or library variable⟩. If `d` declares a static or library
/// variable, the implicitly induced getter of `id` executes as follows:
/// ...
/// - Variable without an initializer. If `d` declares a variable `id` without
///   an initializing expression and does not have the modifier `late`, an
///   invocation of the implicitly induced getter of `id` evaluates to the
///   object that `id` is bound to.
///   The variable is always bound to an object in this case. This may be the
///   `null` object, which is the initial value of some variable declarations
///   covered by this case.
///   If `d` declares a variable `id` without an initializing expression and has
///   the modifier `late`, the implicitly induced getter is a late-uninitialized
///   getter. This determines the semantics of an invocation.
///
/// @description Checks that if `d` declares a variable `id` without an
/// initializing expression and has the modifier `late` it is a dynamic error if
/// `v` has not been bound to an object.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

late int v;

class C {
  static late final int v;
}

mixin M {
  static late final int v;
}

enum E {
  e0;
  static late final int v;
}

class A {}

extension Ext on A {
  static late final int v;
}

extension type ET(int _) {
  static late final int v;
}

void main() {
  Expect.throws(() {
    v = (() {
        print(v);
      return 42;
    })();
  });
  Expect.throws(() {
    C.v = (() {
      print(C.v);
      return 42;
    })();
  });
  Expect.throws(() {
    M.v = (() {
      print(M.v);
      return 42;
    })();
  });
  Expect.throws(() {
    E.v = (() {
      print(E.v);
      return 42;
    })();
  });
  Expect.throws(() {
    Ext.v = (() {
      print(Ext.v);
      return 42;
    })();
  });
  Expect.throws(() {
    ET.v = (() {
      print(ET.v);
      return 42;
    })();
  });
}
