// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Identifier:
/// In an assignment context, the context type schema is the static type of the
/// variable that p resolves to.
///
/// Else the context type schema is _
///
/// @description Check that for an identifier pattern p in an assignment
/// context, the context type schema is the static type of the variable that p
/// resolves to
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

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

  B v1 = b;
  String log = "";
  (v1) = getType(d, (String s) {log += s;});
  Expect.equals("B", log);

  log = "";
  var v2 = c;
  (v2) = getType(d, (String s) {log += s;});
  Expect.equals("C", log);

  log = "";
  B v3 = c;
  (v3) = getType(d, (String s) {log += s;});
  Expect.equals("B", log);
}
