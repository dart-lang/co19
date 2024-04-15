// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code. The
/// augmentation replaces the original function body with the augmenting code.
/// Inside the augmentation body, a special augmented() expression may be used
/// to execute the original function body. That expression takes an argument
/// list matching the original function's parameter list and returns the
/// function's return type.
///
/// @description Checks that inside an augmentation body of an operator
/// `augmented()` expression executes the body of the original operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A02_t12_lib.dart';
import '../../Utils/expect.dart';

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
  Expect.equals("C: original +(A);C: original other=A;augmented;", _log);
  clearLog();

  Expect.equals("M: augment other=B", MA() + "B");
  Expect.equals("M: original +(B);M: original other=B;augmented;", _log);
  clearLog();

  Expect.equals("E: augment other=C", E.e1 + "C");
  Expect.equals("E: original +(C);E: original other=C;augmented;", _log);
  clearLog();

  Expect.equals("Ext: augment other=D", A() + "D");
  Expect.equals("Ext: original +(D);Ext: original other=D;augmented;", _log);
}
