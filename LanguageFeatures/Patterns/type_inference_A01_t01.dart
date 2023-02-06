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
    var ([A x1, x2] && [y1, B y2]) = [b, c];
    x1.expectStaticType<Exactly<A>>();
    x2.expectStaticType<Exactly<C>>();
    y1.expectStaticType<Exactly<B>>();
    y2.expectStaticType<Exactly<B>>();
  }
  {
    final ([A x1, x2] && [y1, B y2]) = [c, d];
    x1.expectStaticType<Exactly<A>>();
    x2.expectStaticType<Exactly<D>>();
    y1.expectStaticType<Exactly<C>>();
    y2.expectStaticType<Exactly<B>>();
  }
  {
    var ([A x1, x2] && [y1, B y2]) = [b, b];
    x1.expectStaticType<Exactly<A>>();
    x2.expectStaticType<Exactly<B>>();
    y1.expectStaticType<Exactly<B>>();
    y2.expectStaticType<Exactly<B>>();
  }
  {
    final ([A x1, x2] && [y1, B y2]) = <C>[d, d];
    x1.expectStaticType<Exactly<A>>();
    x2.expectStaticType<Exactly<C>>();
    y1.expectStaticType<Exactly<C>>();
    y2.expectStaticType<Exactly<B>>();
  }
  String log = "";
  try {
    var ([A x1, x2] && [y1, B y2]) = getType([], (String s) {log += s;});
  } catch (_) {}
  Expect.equals("B", log);
}
