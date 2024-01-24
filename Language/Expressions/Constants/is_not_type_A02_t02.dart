// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e is! T is equivalent to !(e is T) in every
///   way, including whether it’s potentially constant or constant.
///
/// @description Checks that an expression of the form `e is T` is not a
/// constant expression if `e` is not an expression
/// @author sgrekhov22@gmail.com

extension IntExtension on int {}

main() {
  const Foo = int Function() is! Function;
//            ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const Void = void is! Type;
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const cIntExtension = IntExtension is! Type;
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const F = () {} is! Function;
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const R1 = (void,) is! Type;
//            ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const R2 = ({int i}) is! Record;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}
