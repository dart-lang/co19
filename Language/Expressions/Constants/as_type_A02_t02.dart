// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e as T is potentially constant if e is a
///   potentially constant expression and T is a constant type expression, and
///   it is further constant if e is constant.
///
/// @description Checks that an expression of the form `e as T` is not a
/// constant expression if `e` is not an expression
/// @author sgrekhov22@gmail.com

extension IntExtension on int {}

main() {
  const Foo = int Function() as Function;
//            ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const Void = void as Type;
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const cIntExtension = IntExtension as Type;
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const F = () {} as Function;
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const R1 = (void,) as Type;
//            ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const R2 = ({int i}) as Type;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified


}
