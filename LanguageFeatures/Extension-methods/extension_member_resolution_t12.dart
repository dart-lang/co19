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
/// call site if extension declares an instance setter with the same basename as
/// a static method in an extended class has and vice versa
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

String _log = "";

class C {
  static String foo1() => "C";
  String foo2() => "C";
  static set baz1(String v) {
    _log = "C.baz1=$v";
  }
  void set baz2(String v) {
    _log = "C.baz2=$v";
  }
}

extension E on C {
  void set foo1(String v) {
    _log = "E.foo1=$v";
  }
  static void set foo2(String v) {
    _log = "E.foo2=$v";
  }
  String baz1() => "E";
  static String baz2() => "E";
}

main() {
  Expect.equals("C", C.foo1());
  C().foo1 = "a";
  Expect.equals("E.foo1=a", _log);
  Expect.equals("C", C().foo2());
  E.foo2 = "b";
  Expect.equals("E.foo2=b", _log);

  C.baz1 = "c";
  Expect.equals("C.baz1=c", _log);
  Expect.equals("E", C().baz1());
  C().baz2 = "d";
  Expect.equals("C.baz2=d", _log);
  Expect.equals("E", E.baz2());
}
