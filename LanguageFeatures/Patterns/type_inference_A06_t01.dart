// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Parenthesized: The context type schema of the inner subpattern.
///
/// @description Check that the context type schema of a parenthesized pattern
/// is the context type schema of its subpattern
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

  String log = "";
  var (v1) = getType(d, (String s) {log += s;});
  Expect.equals("Object?", log);

  log = "";
  var (B v2) = getType(d, (String s) {log += s;});
  Expect.equals("B", log);

  log = "";
  final (B v3) = getType(d, (String s) {log += s;});
  Expect.equals("B", log);

  log = "";
  final (v4) = getType(d, (String s) {log += s;});
  Expect.equals("Object?", log);
}
