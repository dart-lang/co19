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
/// @description Checks that if `D` declares a constructor named `C.m2`, where
/// `m2` is the basename of `m`, then an expression `C.m` is not treated as an
/// invocation of a static member named `m` declared in an extension. Test that
/// it is a compile-time error if this expression is not a valid reference to
/// the constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C {
  C.foo();
  C.bar();
}

mixin class MC {
  MC._();
  factory MC.foo() = MCO._;
  factory MC.bar() = MCO._;
}

class MCO with MC {
  MCO._();
}

enum E {
  e0.foo(), e1.bar();

  const E.foo();
  const E.bar();
}

extension type ET(int _) {
  ET.foo() : this(0);
  ET.bar() : this(1);
}

extension ExtC on C {
  static set foo(int _) {}
  static String bar() => "ExtC.bar()";
}

extension ExtMC on MC {
  static set foo(int _) {}
  static String bar() => "ExtMC.bar()";
}

extension ExtE on E {
  static String foo() => "ExtE.foo()";
  static String get bar => "ExtE.bar";
}

extension ExtET on ET {
  static set foo(int _) {}
  static String bar() => "ExtET.bar()";
}

main() {
  C.foo = 1;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  String sC = C.bar();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  MC.foo = 1;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  String sMC = MC.bar();
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.foo = 1;
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  String sET = ET.bar();
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.foo();
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.bar;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
