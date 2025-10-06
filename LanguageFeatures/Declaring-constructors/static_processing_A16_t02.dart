// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the declaring constructor is found in the
/// following steps, where `D` is the class, extension type, or enum declaration
/// in the program that includes a declaring constructor `k`, and `D2` is the
/// result of the derivation of the semantics of `D`. The derivation step will
/// delete elements that amount to the declaring constructor. Semantically, it
/// will add a new constructor `k2`, and it will add zero or more instance
/// variable declarations.
/// ...
/// Otherwise, `D` is a declaring body constructor. If the reserved word `this`
/// is followed by `.id` where `id` is an identifier then `k2` has the name
/// `C.id`. If it is followed by `.new` then `k2` has the name `C`. If it is not
/// followed by `.` then `k2` has the name `C`.
///
/// @description Check that if the reserved word `this` is followed by `.new`
/// then the name of the constructor is `C`.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

class C1 {
  this.new(var int v);
}

class C2<T> {
  this.new(var int v);
}

extension type ET1 {
  this.new(int v);
}

extension type ET2<T> {
  this.new(int v);
}

enum E1 {
  e0(1);
  const this.new(final int v);
}

enum E2<T> {
  e0(1);
  const this.new(final int v);
}

main() {
  Expect.isTrue(C1 is C1 Function(int v));
  Expect.isTrue(C2 is C2 Function<T>(int v));
  Expect.isTrue(ET1 is ET1 Function(int v));
  Expect.isTrue(ET2 is ET2 Function<T>(int v));
}
