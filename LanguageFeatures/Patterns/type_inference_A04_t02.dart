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
/// @description Check that for an identifier pattern p not in an assignment
/// context, the context type schema is _
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
  var (v1,) = getType((a,), (String s) {log += s;});
  Expect.equals("Object?", log);

  log = "";
  final (v2,) = getType((c,), (String s) {log += s;});
  Expect.equals("Object?", log);

  var (v3,) = (1,);
  v3.expectStaticType<Exactly<int>>();

  var (v4,) = (1 as num,);
  v4.expectStaticType<Exactly<num>>();

  final (v5,) = ("string",);
  v5.expectStaticType<Exactly<String>>();

  var (v6,) = ("String" as Object,);
  v6.expectStaticType<Exactly<Object>>();
}
