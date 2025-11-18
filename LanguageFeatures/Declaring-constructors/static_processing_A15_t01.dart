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
/// Consider the case where `k` is a declaring header constructor. If the name
/// `C` in `D` and the type parameter list, if any, is followed by `.id` where
/// `id` is an identifier then `k2` has the name `C.id`. If it is followed by
/// `.new` then `k2` has the name `C`. If it is not followed by `.` then `k2`
/// has the name `C`. `D2` omits the part derived from `'.' <identifierOrNew>`
/// that follows the name and type parameter list in `D`, if said part exists.
/// Moreover, `D2` omits the formal parameter list `L` that follows the name,
/// type parameter list, if any, and `.id`, if any.
///
/// @description Check that if the name `C` and the type parameter list is
/// followed by `.id` then the name of the constructor is `C.id`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C1.id(var int v);

class C2<T>.id(var int v);

extension type ET1.id(int v);

extension type ET2<T>.id(int v);

enum E1.id(final int v) {
  e0.id(1);
}

enum E2<T>.id(final int v) {
  e0.id(1);
}

main() {
  Expect.isTrue(C1.id is C1 Function(int v));
  Expect.isTrue(C2.id is C2 Function<T>(int v));
  Expect.isTrue(ET1.id is ET1 Function(int v));
  Expect.isTrue(ET2.id is ET2 Function<T>(int v));
}
