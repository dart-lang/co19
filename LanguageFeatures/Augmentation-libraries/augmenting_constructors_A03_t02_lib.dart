// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory constructor is `const` and the augmenting constructor is
///   not or vice versa.
///
/// @description Checks that it is a compile-time error if the introductory
/// constructor is `const` and the augmenting constructor is not.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A03_t02.dart';

augment class C {
  augment const C();
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment const ET.foo(this.id);
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
