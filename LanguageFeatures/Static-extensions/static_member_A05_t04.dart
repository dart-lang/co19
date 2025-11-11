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
/// a static getter as `m`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

String log = "";

class C {}

mixin M {}

extension type ET(int _) {}

enum E {
  e0;
}

extension ExtC on C {
  static void set foo(String v) {
    log = v;
  }
}

extension ExtM on M {
  static void set foo(String v) {
    log = v;
  }
}

extension ExtET on ET {
  static void set foo(String v) {
    log = v;
  }
}

extension ExtE on E {
  static void set foo(String v) {
    log = v;
  }
}

main() {
  C.foo = "ExtC";
  Expect.equals("ExtC", log);
  M.foo = "ExtM";
  Expect.equals("ExtM", log);
  ET.foo = "ExtET";
  Expect.equals("ExtET", log);
  E.foo = "ExtE";
  Expect.equals("ExtE", log);

  ExtC.foo = "ExtC";
  Expect.equals("ExtC", log);
  ExtM.foo = "ExtM";
  Expect.equals("ExtM", log);
  ExtET.foo = "ExtET";
  Expect.equals("ExtET", log);
  ExtE.foo = "ExtE";
  Expect.equals("ExtE", log);
}
