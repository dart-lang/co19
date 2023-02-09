// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Cast: The context type schema is _.
///
/// @description Check that for a cast pattern the context type schema is _
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";
import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

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
  var (v1 as B) = getType(d, (String s) {log += s;});
  Expect.equals("Object?", log);

  var (v2 as B) = d;
  v2.expectStaticType<Exactly<D>>();

  log = "";
  final (v3 as B) = getType(d, (String s) {log += s;});
  Expect.equals("Object?", log);
}
