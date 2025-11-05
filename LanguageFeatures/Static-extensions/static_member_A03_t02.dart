// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an expression `e` which is a member invocation with
/// syntactic receiver `C` and an associated member name `m`. Assume that `m` is
/// a static member declared by `D`. The static analysis and dynamic semantics
/// of this expression is the same as in Dart before the introduction of this
/// feature.
///
/// @description Checks that if `C` contains an instance member with the
/// basename `m` then it is not an error for extensions to declare a static
/// member with the same basename. Invocation of `m` will invoke the appropriate
/// member.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

String log = "";

class C {
  int foo = 42;
}

mixin M {
  int foo() => 42;
}

class MA = Object with M;

extension type ET(int _) {
  int get foo => 42;
}

enum E {
  e0;
  void set foo(int v) {
    log = "$v";
  }
}

extension ExtC on C {
  static String foo() => "ExtC";
}

extension ExtM on M {
  static String foo() => "ExtM";
}

extension ExtET on ET {
  static String foo() => "ExtET";
}

extension ExtE on E {
  static String foo() => "ExtE";
}

main() {
  Expect.equals(42, C().foo);
  Expect.equals(42, MA().foo());
  Expect.equals(42, ET(0).foo);
  E.e0.foo = 42;
  Expect.equals("42", log);

  Expect.equals("ExtC", ExtC.foo());
  Expect.equals("ExtM", ExtM.foo());
  Expect.equals("ExtET", ExtET.foo());
  Expect.equals("ExtE", ExtE.foo());
}
