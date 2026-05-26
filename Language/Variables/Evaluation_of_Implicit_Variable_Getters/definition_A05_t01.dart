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
/// @description Checks the implicit getter of an initialized instance variable
/// is late-initialized and evaluated only once.
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

String log = "";

writeLog(String i) {
  log += i;
  return i;
}

class C {
  late var a = writeLog("a");
  late String b = writeLog("b");
  late final c = writeLog("c");
  late final String d = writeLog("d");
}

mixin M {
  late var a = writeLog("a");
  late String b = writeLog("b");
  late final c = writeLog("c");
  late final String d = writeLog("d");
}

class MA = Object with M;

main() {
  C c = C();
  Expect.equals("a", c.a);
  Expect.equals("a", log);
  Expect.equals("a", c.a);
  Expect.equals("a", log);

  Expect.equals("b", c.b);
  Expect.equals("ab", log);
  Expect.equals("b", c.b);
  Expect.equals("ab", log);

  Expect.equals("c", c.c);
  Expect.equals("abc", log);
  Expect.equals("c", c.c);
  Expect.equals("abc", log);

  Expect.equals("d", c.d);
  Expect.equals("abcd", log);
  Expect.equals("d", c.d);
  Expect.equals("abcd", log);

  log = "";
  M m = MA();
  Expect.equals("a", m.a);
  Expect.equals("a", log);
  Expect.equals("a", m.a);
  Expect.equals("a", log);

  Expect.equals("b", m.b);
  Expect.equals("ab", log);
  Expect.equals("b", m.b);
  Expect.equals("ab", log);

  Expect.equals("c", m.c);
  Expect.equals("abc", log);
  Expect.equals("c", m.c);
  Expect.equals("abc", log);

  Expect.equals("d", m.d);
  Expect.equals("abcd", log);
  Expect.equals("d", m.d);
  Expect.equals("abcd", log);
}
