// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Variable:
/// i. If p has a type annotation, the context type schema is the annotated type
///
/// ii. Else the context type schema is _.
///
/// @description Check that if a variable pattern has a type annotation, then
/// the context type schema is the annotated type. Otherwise it is _
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/static_type_helper.dart";
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
  var (B v1) = getType(d, (String s) {log += s;});
  Expect.equals("B", log);

  log = "";
  var (v2) = getType(d, (String s) {log += s;});
  Expect.equals("Object?", log);

  var (v3) = (42);
  v3.expectStaticType<Exactly<int>>();

  log = "";
  final (B v4) = getType(d, (String s) {log += s;});
  Expect.equals("B", log);

  log = "";
  final (v5) = getType(d, (String s) {log += s;});
  Expect.equals("Object?", log);

  final (v6) = (42 as num?);
  v6.expectStaticType<Exactly<num?>>();
}
