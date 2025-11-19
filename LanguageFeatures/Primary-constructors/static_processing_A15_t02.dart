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
/// followed by `.new` then the name of the constructor is `C`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1.new(var int v);

class C2<T>.new(var int v);

extension type ET1.new(int v);

extension type ET2<T>.new(int v);

enum E1.new(final int v) {
  e0(1);
}

enum E2<T>.new(final int v) {
  e0(1);
}

main() {
  // Only a constructor can be invoked with the `new` keyword. This proves that
  // the name of the constructor is `C1`.
  new C1(1);
  new C2(2);
  new ET1(1);
  new ET2(2);
}
