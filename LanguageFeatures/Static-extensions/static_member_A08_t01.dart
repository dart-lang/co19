// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the case where `D` does not declare any static members whose
/// basename is the basename of `m`, and `D` does not declare any constructors
/// named `C.m2` where `m2` is the basename of `m`, let `M` be the set
/// containing each accessible extension whose on-declaration is `D`, and whose
/// static members include one with the name `m`, or which declares a
/// constructor named `C.m`.
///
/// If `D` does declare a constructor with such a name `C.m2` then the given
/// expression is not a static member invocation. This case is described in a
/// section below.
///
/// @description Checks that if `D` declares a constructor named `C.m`, then
/// `C.m(arguments)` and `C.m` are an invocation and a tearoff of that
/// constructor even if an accessible extension declares a static member named
/// `m`. Test that the static member is still accessible via the extension name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C {
  final String id;
  C.foo() : id = "C.foo";
  C.bar() : id = "C.bar";
}

mixin class MC {
  String id = "";
  MC._();
  factory MC.foo() => MCO._()..id = "MC.foo";
  factory MC.bar() => MCO._()..id = "MC.bar";
}

class MCO with MC {
  MCO._();
}

extension type ET(String id) {
  ET.foo() : this("ET.foo");
  ET.bar() : this("ET.bar");
}

extension ExtC on C {
  static String foo() => "ExtC.foo()";
  static String get bar => "ExtC.bar";
}

extension ExtMC on MC {
  static String foo() => "ExtMC.foo()";
  static String get bar => "ExtMC.bar";
}

extension ExtET on ET {
  static String foo() => "ExtET.foo()";
  static String get bar => "ExtET.bar";
}

main() {
  var c = C.foo();
  c.expectStaticType<Exactly<C>>();
  Expect.equals("C.foo", c.id);
  var cf = C.bar;
  cf.expectStaticType<Exactly<C Function()>>();
  Expect.equals("C.bar", cf().id);
  Expect.equals("ExtC.foo()", ExtC.foo());
  Expect.equals("ExtC.bar", ExtC.bar);

  var mc = MC.foo();
  mc.expectStaticType<Exactly<MC>>();
  Expect.equals("MC.foo", mc.id);
  var mcf = MC.bar;
  mcf.expectStaticType<Exactly<MC Function()>>();
  Expect.equals("MC.bar", mcf().id);
  Expect.equals("ExtMC.foo()", ExtMC.foo());
  Expect.equals("ExtMC.bar", ExtMC.bar);

  var et = ET.foo();
  et.expectStaticType<Exactly<ET>>();
  Expect.equals("ET.foo", et.id);
  var etf = ET.bar;
  etf.expectStaticType<Exactly<ET Function()>>();
  Expect.equals("ET.bar", etf().id);
  Expect.equals("ExtET.foo()", ExtET.foo());
  Expect.equals("ExtET.bar", ExtET.bar);
}
