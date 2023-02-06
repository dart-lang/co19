// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Parenthesized: The context type schema of the inner subpattern.
///
/// @description Check that a context type schema of a parenthesized pattern is
/// a context type schema of its subpattern
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
  {
    var ((A v1, v2)) = (b, a);
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<A>>();
  }
  {
    final ((A v1, v2)) = (b, c);
    v1.expectStaticType<Exactly<A>>();
    v2.expectStaticType<Exactly<C>>();
  }
  var (v2) = c;
  v2.expectStaticType<Exactly<C>>();
  final (B v3) = d;
  v3.expectStaticType<Exactly<B>>();
  final (v4) = c;
  v4.expectStaticType<Exactly<C>>();

  String log = "";
  var (v5) = getType(d, (String s) {log += s;});
  Expect.equals("Object?", log);
  log = "";
  final (B v6) = getType(d, (String s) {log += s;});
  Expect.equals("B", log);
  log = "";
  final (v7) = getType(d, (String s) {log += s;});
  Expect.equals("Object?", log);
}
