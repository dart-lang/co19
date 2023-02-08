// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Record: A record type schema with positional and named fields corresponding
/// to the type schemas of the corresponding field subpatterns.
///
/// @description Check that the type schema of a record pattern is a record type
/// schema with positional and named fields corresponding to the type schemas of
/// the corresponding field subpatterns.
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
  try {
    var (A v1, v2, n1: B v3, n2: v4) = getType((), (String s) {log += s;});
  } catch (_) {}
  Expect.equals(typeOf<(A, Object?, {B n1, Object? n2})>().toString(), log);

  log = "";
  try {
    final (B v1 as C, v2, n1: v3, n2: C v4 as D) =
        getType((), (String s) {log += s;});
  } catch (_) {}
  Expect.equals(typeOf<(B, Object?, {Object? n1, C n2})>().toString(), log);
}
