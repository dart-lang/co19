// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` refers to
///   the augmented operator method, which must be immediately invoked using
///   function call syntax. For example when augmenting `operator +` you would
///   use `augmented(1)` to call the augmented operator, and when augmenting
///   `operator []=` you would use the `augmented(key, value)` syntax.
///
/// @description Checks that it is a compile-time error to declare a local
/// variable named `augmented` inside of an augmenting operator. Test a
/// parenthesized pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A05_t06.dart';

augment class C {
  augment String operator +(Object other) {
    var (augmented) = (42);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  }
}

augment mixin M {
  augment String operator +(Object other) {
    var (augmented) = 42;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  }
}

augment enum E {
  augment e1;
  augment String operator +(Object other) {
    final (augmented) = (42);
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  }
}

augment extension Ext {
  augment String operator +(Object other) {
    final (augmented) = 42;
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  }
}

augment extension type ET {
  augment String operator +(Object other) {
    final (augmented) = 42;
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return "Augmented";
  }
}
