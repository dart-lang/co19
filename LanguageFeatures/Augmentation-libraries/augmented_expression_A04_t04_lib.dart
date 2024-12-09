// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: Inside an augmenting function body (including
///   factory constructors but not generative constructors) `augmented` refers
///   to the augmented function. Tear-offs are not allowed, and this function
///   must immediately be invoked.
///
/// @description Checks that it is a compile-time error to declare a local
/// variable named `augmented` inside of an augmenting function. Test a
/// variable pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A04_t04.dart';

augment void topLevelFunction() {
  switch((1,)) {
    case (var augmented,):
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment class C {
  augment static void staticMethod() {
    switch((1,)) {
      case (var augmented,):
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
  augment void instanceMethod() {
    switch((1,)) {
      case (var augmented,):
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

augment mixin M {
  augment static void staticMethod() {
    switch((1,)) {
      case (var augmented,):
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
  augment void instanceMethod() {
    switch((1,)) {
      case (var augmented,):
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

augment enum E {
  augment e1;

  augment static void staticMethod() {
    switch((1,)) {
      case (var augmented,):
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
  augment void instanceMethod() {
    switch((1,)) {
      case (var augmented,):
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

augment extension Ext {
  augment static void staticMethod() {
    switch((1,)) {
      case (var augmented,):
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
  augment void instanceMethod() {
    switch((1,)) {
      case (var augmented,):
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

augment extension type ET {
  augment static void staticMethod() {
    switch((1,)) {
      case (var augmented,):
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
  augment void instanceMethod() {
    switch((1,)) {
      case (var augmented,):
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}
