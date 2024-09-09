// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting factory constructor marked `augment` works in
/// the same way as a normal function augmentation.
/// If it has a body, it replaces the body of the augmented constructor
/// (if present), and it may invoke the augmented body by calling
/// `augmented(arguments)`.
///
/// @description Checks that it is a compile-time error to call `augmented()` in
/// a factory constructor body with a formal parameters which don't match the
/// signature of the introductory constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A16_t04.dart';

augment class C {
  augment factory C.foo(int x, [int y]) {
    augmented(); // Ok for a non-factory constructor, but error for factory one
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x, x, y);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x, y: y);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment factory C.bar(int x, {int y}) {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x, x, y);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x, x: y);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment factory C.baz({required int x}) {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x: x, y: x);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}


augment extension type ET {
  augment factory ET.foo(int x) {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x, x);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x: x);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment factory ET.bar([int x = 0]) {
    augmented(x, x);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x: x);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment factory ET.baz({int x = 0}) {
    augmented(x);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x: x, y: x);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment factory ET.qux({required int x}) {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(x);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    augmented(y: x);
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
