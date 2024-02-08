// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a variable x is promotable via initialization given
/// variable model VM if x is a local variable (not a formal parameter) and:
///
///  VM = VariableModel(declared, promoted, tested, assigned, unassigned,
///    captured)
///  and captured is false
///  and promoted is empty
///  and x is declared with no explicit type and no initializer
///  and assigned is false and unassigned is true
///
/// @description Checks that if captured is true then promotion via
/// initialization does not happen.
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak

import '../../../Utils/expect.dart';

class S {}
class T extends S {
  int foo() => 42;
}

Function? f;

main() {
  var x;
  bar() {
    x = new S();
  }
  f = bar;
  x = new T();
  Expect.throws(() {
    x.g();
  }, (e) => e is NoSuchMethodError);
}
