// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The augmenting function does not have to pass the same arguments
/// to `augmented(…)` as were passed to it. It may invoke `augmented` once, more
/// than once, or not at all.
///
/// @description Checks that it's not an error if an augmenting function passes
/// different arguments to the `augmented` expression and calls it more than
/// once. Test operators.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_functions_A03_t12_lib.dart';

String _log = "";

void clearLog() {
  _log = "";
}

class A {}

class C {
  String operator +(String other) {
    _log += "C: original +($other);";
    return "C: original other=$other;";
  }
}

mixin M {
  String operator +(String other) {
    _log += "M: original +($other);";
    return "M: original other=$other";
  }
}

enum E {
  e1;

  String operator +(String other) {
    _log += "E: original +($other);";
    return "E: original other=$other";
  }
}

extension Ext on A {
  String operator +(String other) {
    _log += "Ext: original +($other);";
    return "Ext: original other=$other";
  }
}

class MA = Object with M;

main() {
  Expect.equals("C: augment other=A", C() + "A");
  Expect.equals(
      "C: original +(a);C: original other=a;augmented;C: original +(b);", _log);
  clearLog();

  Expect.equals("M: augment other=B", MA() + "B");
  Expect.equals(
      "M: original +(c);M: original other=c;augmented;M: original +(d);", _log);
  clearLog();

  Expect.equals("E: augment other=C", E.e1 + "C");
  Expect.equals(
      "E: original +(e);E: original other=e;augmented;E: original +(f);", _log);
  clearLog();

  Expect.equals("Ext: augment other=D", A() + "D");
  Expect.equals(
      "Ext: original +(g);Ext: original other=g;augmented;Ext: original +(h);",
      _log);
}
