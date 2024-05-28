// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Check that it does not give rise to an ambiguity error at the
/// call site if extension declares an instance getter with the same name as a
/// static method in an extended class has and vice versa
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

class C {
  static String foo1() => "C";
  String foo2() => "C";
  static String get baz1 => "C";
  String get baz2 => "C";
}

extension E on C {
  String get foo1 => "E";
  static String get foo2 => "E";
  String baz1() => "E";
  static String baz2() => "E";
}

main() {
  Expect.equals("C", C.foo1());
  Expect.equals("E", C().foo1);
  Expect.equals("C", C().foo2());
  Expect.equals("E", E.foo2);
  Expect.equals("C", C.baz1);
  Expect.equals("E", C().baz1());
  Expect.equals("C", C().baz2);
  Expect.equals("E", E.baz2());
}
