// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Non-constant shorthand:
/// ...
/// It's a compile-time error if that declaration does not have a static member
/// with base name `id`, or an unnamed constructor for `.new`.
///
/// @description Checks that it is a compile-time error if that declaration does
/// not have an unnamed constructor for `.new()` invokation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C {
  C.foo();
}

extension type ET.foo(int _) {}

main() {
  C c = .new();
//      ^
// [analyzer] unspecified
// [cfe] unspecified

  ET et = .new();
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
