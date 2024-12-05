// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Non-constant shorthand:
/// ...
/// It's a compile-time error if a static member lookup with base name
/// `id`/`new` on that declaration does not find a static member.
///
/// @description Checks that it's a compile-time error if a static member lookup
/// with base name `id` does not find a static member.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C {
  C.foo();
  C get id => C.foo();
}

mixin M {
  M? get id => null;
}

enum E {
  e0;
  E get id => E.e0;
}

extension type ET.foo(int _) {
  ET get id => this;
}

main() {
  C c = .id;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  M? m = .id;
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  E e = .id;
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  ET et = .id;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
