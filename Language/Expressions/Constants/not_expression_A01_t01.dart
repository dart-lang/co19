// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
///
/// @description Checks that it is a compile-time error if in a expression of
/// type `const c = e;` `e` is not an expression
/// @author sgrekhov22@gmail.com

extension IntExtension on int {}

main() {
  const Foo = int Function();
//            ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const Void = void;
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const Extension = IntExtension;
//                  ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const F = () {};
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
