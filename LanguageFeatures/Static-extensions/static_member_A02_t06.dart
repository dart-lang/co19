// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an expression `e` which is a member invocation with
/// syntactic receiver `C` and an associated member name `m`. Assume that `m` is
/// a static member declared by `D`. The static analysis and dynamic semantics
/// of this expression is the same as in Dart before the introduction of this
/// feature.
/// ...
/// In the case where `D` does not declare any static members whose basename is
/// the basename of `m`, and `D` does not declare any constructors named `C.m2`
/// where `m2` is the basename of `m`, let `M` be the set containing each
/// accessible extension whose on-declaration is `D`, and whose static members
/// include one with the name `m`, or which declares a constructor named `C.m`.
/// ...
/// An error occurs if `M` is empty, or `M` contains more than one member.
///
/// @description Checks that that it is not an error if `M` contains more than
/// one member but `m` is not invoked. Test a getter as `m`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C {}

mixin M {}

extension type ET(int _) {}

enum E {
  e0;
}

extension ExtC1 on C {
  static int get foo => 1;
}

extension ExtC2 on C {
  static int get foo => 2;
}

extension ExtM1 on M {
  static int get foo => 1;
}

extension ExtM2 on M {
  static int get foo => 2;
}

extension ExtET1 on ET {
  static int get foo => 1;
}

extension ExtET2 on ET {
  static int get foo => 2;
}

extension ExtE1 on E {
  static int get foo => 1;
}

extension ExtE2 on E {
  static int get foo => 2;
}

main() {
  Expect.equals(1, ExtC1.foo);
  Expect.equals(2, ExtC2.foo);
  Expect.equals(1, ExtM1.foo);
  Expect.equals(2, ExtM2.foo);
  Expect.equals(1, ExtET1.foo);
  Expect.equals(2, ExtET2.foo);
  Expect.equals(1, ExtE1.foo);
  Expect.equals(2, ExtE2.foo);
}
