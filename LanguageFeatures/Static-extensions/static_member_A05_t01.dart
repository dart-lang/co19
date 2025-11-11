// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an expression `e` which is a member invocation with
/// syntactic receiver `C` and an associated member name `m`. Assume that `m` is
/// a static member declared by `D`. The static analysis and dynamic semantics
/// of this expression is the same as in Dart before the introduction of this
/// feature.
/// ...
/// Assume that it is an extension `E` that declares a static member named `m`.
/// The invocation is then treated as `E.m()`.
///
/// @description Checks that invocation of `m` is then treated as `E.m()`. Test
/// a static variable as `m`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C {}

mixin M {}

extension type ET(int _) {}

enum E {
  e0;
}

extension ExtC on C {
  static String foo = "ExtC";
}

extension ExtM on M {
  static String foo = "ExtM";
}

extension ExtET on ET {
  static String foo = "ExtET";
}

extension ExtE on E {
  static String foo = "ExtE";
}

main() {
  Expect.equals("ExtC", C.foo);
  Expect.equals("ExtM", M.foo);
  Expect.equals("ExtET", ET.foo);
  Expect.equals("ExtE", E.foo);

  Expect.equals("ExtC", ExtC.foo);
  Expect.equals("ExtM", ExtM.foo);
  Expect.equals("ExtET", ExtET.foo);
  Expect.equals("ExtE", ExtE.foo);
}
