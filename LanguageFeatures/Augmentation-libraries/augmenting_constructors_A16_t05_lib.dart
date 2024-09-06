// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting factory constructor marked `augment` works in
/// the same way as a normal function augmentation.
/// If it has a body, it replaces the body of the augmented constructor
/// (if present), and it may invoke the augmented body by calling
/// `augmented(arguments)`.
///
/// @description Checks that it is a compile-time error to tear-off `augmented`
/// in an augmenting factory constructor body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A16_t05.dart';

augment class C {
  augment factory C.foo(int x, [int y]) {
    print(augmented);
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented.toString();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension type ET {
  augment factory ET.foo(int x) {
    print(augmented);
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented.toString();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
