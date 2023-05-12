// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Cast: The context type schema is _.
///
/// @description Check that for a cast subpattern the context type schema is _
/// and is inferred as Object?
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";
import "../../Utils/expect.dart";

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
  var (v1 as B,) = getType((d,), (String s) {log += s;});
  Expect.equals("(Object?)", log);

  log = "";
  final (v2 as A,) = getType((c,), (String s) {log += s;});
  Expect.equals("(Object?)", log);
}
