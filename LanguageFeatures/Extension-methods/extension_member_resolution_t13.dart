// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For any member access, x.foo, x.bar(), x.baz = 42, x(42),
/// x[0] = 1 or x + y, including null-aware and cascade accesses which
/// effectively desugar to one of those direct accesses, and including implicit
/// member accesses on this, the language first checks whether the static type
/// of x has a member with the same base name as the operation. That is, if it
/// has a corresponding instance member, respectively, a foo method or getter or
/// a foo= setter, a bar member or bar= setter, a baz member or baz= setter, a
/// call method, a []= operator or a + operator. If so, then the operation is
/// unaffected by extensions. This check does not care whether the invocation is
/// otherwise correct, based on number or type of the arguments, it only checks
/// whether there is a member at all.
///
/// @description Check that extension members on nullable types can be invoked
/// without null-check.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

class C {}
enum E {e0;}
extension type ET(int v) {}

extension EC on C? {
  String foo() => "EC";
  String get bar => "EC.bar";
  void set baz(String v) {}
}

extension EE on E? {
  String foo() => "EE";
  String get bar => "EE.bar";
  void set baz(String v) {}
}

extension EET on ET? {
  String foo() => "EET";
  String get bar => "EET.bar";
  void set baz(String v) {}
}

testC(C? c) {
  Expect.equals("EC", c.foo()); // can be invoked without `?.`
  Expect.equals("EC.bar", c.bar);
  c.baz = "";
}

testE(E? e) {
  Expect.equals("EE", e.foo());
  Expect.equals("EE.bar", e.bar);
  e.baz = "";
}

testET(ET? et) {
  Expect.equals("EET", et.foo());
  Expect.equals("EET.bar", et.bar);
  et.baz = "";
}

main() {
  testC(C());
  testC(null);
  testE(E.e0);
  testE(null);
  testET(ET(0));
  testET(null);
}
