// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the primary constructor is found in the
/// following steps, where `D` is the class, mixin class, extension type, or
/// enum declaration in the program that includes a primary constructor `k`, and
/// `D2` is the result of the derivation of the semantics of `D`. The derivation
/// step will delete elements that amount to the primary constructor.
/// Semantically, it will add a new constructor `k2`, and it will add zero or
/// more instance variable declarations.
/// ...
/// Finally, `k2` is added to `D2`, and `D` is replaced by `D2`.
///
/// @description Check that if a `<primaryConstructorBodySignature>` contains a
/// body, this body is executed after execution of the initializer list (if
/// any). Test the case when the primary constructor is named.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

String log = "";

class C1.someName() {
  int? v;
  this {
    v = 1;
  }
}

class C2.someName() {
  int v;
  this: v = 0 {
    Expect.equals(0, v);
    v = 2;
  }
}

class C3.someName(this.v) {
  int v;
  this: assert(() {
    Expect.equals(2, v);
    return true;
  }()) {
    v = 3;
  }
}

extension type ET1.someName(int v) {
  this {
    log = "$v";
  }
}

extension type ET2.someName(int v) {
  this: assert((){
    log = "initializer list";
    return true;
  }()) {
    if (assertStatementsEnabled()) {
      Expect.equals("initializer list", log);
    }
    log = "$v";
  }
}

enum E.someName(int v) {
  e0(0);
  final int v;
  this: v = v;
}

main() {
  Expect.equals(1, C1().v);
  Expect.equals(2, C2().v);
  Expect.equals(3, C3(2).v);
  ET1(1);
  Expect.equals("1", log);
  log = "";
  ET2(2);
  Expect.equals("2", log);
  Expect.equals(0, E.e0.v);
}
