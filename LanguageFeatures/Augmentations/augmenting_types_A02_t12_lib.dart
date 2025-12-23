// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmenting declaration and augmented declaration do not have all the
///   same modifiers: `abstract`, `base`, `final`, `interface`, `sealed` and
///   `mixin` for `class` declarations, and `base` for `mixin` declarations.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// and the corresponding type do not have identical modifiers. Test augmenting
/// a `abstract mixin class`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

part of 'augmenting_types_A02_t12.dart';

augment class C1 {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment base class C2 {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

augment interface class C3 {}
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

augment final class C4 {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

augment sealed class C5 {}
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract class C6 {}
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract base class C7 {}
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract interface class C8 {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract final class C9 {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin class C10 {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

augment base mixin class C11 {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

augment abstract mixin class C12 {} // Ok

augment abstract base mixin class C13 {}
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin C14 {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment base mixin C15 {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
