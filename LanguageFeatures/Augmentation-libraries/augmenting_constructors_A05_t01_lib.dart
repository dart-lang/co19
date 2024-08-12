// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory constructor has a super initializer (super constructor
///   invocation at the end of the initializer list) and the augmenting
///   constructor does too.
///
/// @description Checks that it is a compile-time error if the introductory
/// constructor has a super initializer and the augmenting constructor does too.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A05_t01.dart';

augment class C1 {
  augment C1(): super(0);
//              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C2 {
  augment C2(): super.foo(0);
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
