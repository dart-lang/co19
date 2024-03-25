// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmenting type and corresponding type do not have all the same
///   modifiers (final, sealed, mixin, etc).
///
/// @description Checks that it is a compile-time error if an augmenting type
/// and corresponding type do not have all the same modifiers (final, sealed,
/// mixin, etc). Test `abstract interface class` in the main library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

library augment 'augmenting_types_A02_t08.dart';

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment base class C {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

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

augment abstract interface class C {} // Ok

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
