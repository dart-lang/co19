// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Static or library variable⟩. If `d` declares a static or
/// library variable, the implicitly induced getter of `id` executes as follows:
/// - Non-constant variable with an initializer. In the case where `d` has an
///   initializing expression and is not constant, the implicitly induced getter
///   of `id` is a late-initialized getter. This determines the semantics of an
///   invocation.
///
/// @description Checks that it is not an error if during an evaluation of the
/// initializing expression `id` is invoked.
/// @author msyabro
/// @Issue 42470
/// @issue 42642

import "../../../Utils/expect.dart";

int count = 0;

f(func) {
  try {
    throw 1;
  } on int catch (_) {
    count++;
    if (count < 5) {
      func();
    }
  }
  count = 0;
}

int? variable = f(() => variable);
final int? finalVariable = f(() => finalVariable);

class C {
  static int? variable = f(() => variable);
  static final int? finalVariable = f(() => finalVariable);
}

mixin M {
  static int? variable = f(() => variable);
  static final int? finalVariable = f(() => finalVariable);
}

enum E {
  e0;
  static int? variable = f(() => variable);
  static final int? finalVariable = f(() => finalVariable);
}

class A {}

extension Ext on A {
  static int? variable = f(() => variable);
  static final int? finalVariable = f(() => finalVariable);
}

extension type ET(int _) {
  static int? variable = f(() => variable);
  static final int? finalVariable = f(() => finalVariable);
}

main() {
  Expect.equals(null, variable);
  Expect.throws(() { finalVariable; });
  Expect.equals(null, C.variable);
  Expect.throws(() { C.finalVariable; });
  Expect.equals(null, M.variable);
  Expect.throws(() { M.finalVariable; });
  Expect.equals(null, E.variable);
  Expect.throws(() { E.finalVariable; });
  Expect.equals(null, Ext.variable);
  Expect.throws(() { Ext.finalVariable; });
  Expect.equals(null, ET.variable);
  Expect.throws(() { ET.finalVariable; });
}
