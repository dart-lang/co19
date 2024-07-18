// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The augmenting declaration and augmented declaration do not have all the
///   same modifiers: `abstract`, `base`, `final`, `interface`, `sealed` and
///   `mixin` for `class` declarations, and `base` for `mixin` declarations.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// and corresponding type do not have all the same modifiers. Test  augmenting
/// `base class`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A02_t02.dart';

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment base class C {} // Ok

augment interface class C {}
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

augment final class C {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

augment sealed class C {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract class C {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract base class C {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract interface class C {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract final class C {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin class C {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

augment base mixin class C {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract mixin class C {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract base mixin class C {}
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment base mixin C {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
