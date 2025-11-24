// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code.
/// ...
/// The augmentation replaces the augmented function’s body with the augmenting
/// function’s body.
///
/// @description Checks that an operator may be augmented and the original code
/// is replaced by the augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_functions_A01_t12_lib.dart';

String _log = "";

void clearLog() {
  _log = "";
}

class A {}

class C {
  String operator +(String other) {
    _log += "C: original operator +($other);";
    return "C: original other=$other";
  }
}

mixin M {
  String operator +(String other) {
    _log += "M: original operator +($other);";
    return "M: original other=$other";
  }
}

enum E {
  e1;

  String operator +(String other) {
    _log += "E: original operator +($other);";
    return "E: original other=$other";
  }
}

extension Ext on A {
  String operator +(String other) {
    _log += "Ext: original operator +($other);";
    return "Ext: original other=$other";
  }
}

class MA = Object with M;

main() {
  Expect.equals("C: augment other=A", C() + "A");
  Expect.equals("C: augment operator +(A);", _log);
  clearLog();

  Expect.equals("M: augment other=B", MA() + "B");
  Expect.equals("M: augment operator +(B);", _log);
  clearLog();

  Expect.equals("E: augment other=C", E.e1 + "C");
  Expect.equals("E: augment operator +(C);", _log);
  clearLog();

  Expect.equals("Ext: augment other=D", A() + "D");
  Expect.equals("Ext: augment operator +(D);", _log);
}
