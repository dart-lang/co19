// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A read of a field or variable which is marked as late which has
/// not yet been written to causes the initializer expression of the variable to
/// be evaluated to a value, assigned to the variable or field, and returned as
/// the value of the read.
///
/// If there is no initializer expression, the read causes a runtime error to be
/// thrown
///
/// @description Check that it is a runtime error to read late variable without
/// initializer expression
/// @author sgrekhov@unipro.ru
/// @issue 39801

import "../../Utils/expect.dart";

class C {
  static late final String s1;
  static late String s2;
  covariant late String v1;
  late final String v2;
  late String v3;
}

late final String g1;
late String g2;

main() {
  Expect.throws(() {C.s1;});
  Expect.throws(() {C.s2;});
  C c = new C();
  Expect.throws(() {c.v1;});
  Expect.throws(() {c.v2;});
  Expect.throws(() {c.v3;});

  Expect.throws(() {g1;});
  Expect.throws(() {g2;});
}
