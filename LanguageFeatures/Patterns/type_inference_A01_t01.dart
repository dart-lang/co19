// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
///
/// Logical-and: The greatest lower bound of the context type schemas of the
/// branches.
///
/// @description Check that the context type schema for logical-and pattern is
/// the greatest lower bound of the context type schemas of the branches.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

class A {}
class B extends A {}
class C extends B {}
class D extends C {}

main() {
  A a = A();
  B b = B();
  C c = C();
  D d = D();

  String log = "";
  try {
    var ([A x1, x2] && [y1, B y2]) = getType([], (String s) {log += s;});
  } catch (_) {}
  Expect.equals("List<B>", log);

  log = "";
  try {
    var ([C x1, x2] && <B>[y1, A y2]) = getType([], (String s) {log += s;});
  } catch (_) {}
  Expect.equals("List<C>", log);
}
