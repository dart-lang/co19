// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented factory constructor has a body, or it is redirecting.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor if the augmented constructor has a
/// non-empty initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A18_t02.dart';

augment class C {
  augment C.foo(int x, {int y = 0}): this(x);
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.bar({required int x}): this.foo(x);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
}
