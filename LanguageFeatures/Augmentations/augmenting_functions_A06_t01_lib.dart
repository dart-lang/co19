// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An augmenting declaration uses `augmented` when the augmented declaration
///   has no concrete implementation. Note that all external declarations are
///   assumed to have an implementation provided by another external source, and
///   they will throw a runtime exception when called if not.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration uses `augmented` when the original declaration has no concrete
/// implementation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_functions_A06_t01.dart';

augment class C1 {
  augment void foo() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment abstract class C2 {
  augment void foo() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  augment void foo() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e1;

  augment void foo() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  augment void foo() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension type ET {
  augment void foo() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
