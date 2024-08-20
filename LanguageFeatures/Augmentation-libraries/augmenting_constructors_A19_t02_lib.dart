// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting factory constructor marked `augment` adds its
/// factory redirection to the augmented constructor.
///
/// The result of applying the augmenting constructor is a redirecting factory
/// constructor with the same target constructor designation as the augmenting
/// constructor. This removes the potentially non-redirecting property of the
/// constructor.
///
/// @description Checks that it is a compile-time error if an introductory
/// constructor already has a redirection.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A19_t02.dart';

augment class C {
  augment factory C.bar(int x, [int y]) = C;
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.baz(int x, {int y}) = C.foo;
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.qux(int x, [int y]) = D;
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
}
