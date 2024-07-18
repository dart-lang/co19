// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation declaration D is a declaration marked with the
/// new built-in identifier `augment`, which makes D augment a declaration D1
/// with the same name and in the same context as D. D1 is determined as being
/// before D and after every other declaration with the same name and in the
/// same context which is before D (that is, D1 is the greatest declaration
/// which is smaller than D, according to the 'after' ordering). A compile-time
/// error occurs if no declaration satisfies the requirements on D1.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration appears before non-augmenting one. Test augmented declaration in
/// a main library.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_declarations_A02_t03_lib.dart';

augment int variable = 0;
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment final finalVariable = 0;
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment late int lateVariable = 0;
//               ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment late final lateFinalVariable = 0;
//                 ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment void function() {}
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment int get getter => 0;
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment void set setter(int _) {}
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  int variable = 0;
  final finalVariable = 0;
  late int lateVariable = 0;
  late final lateFinalVariable = 0;
  void function() {}

  print(variable);
  print(function);
  print(getter);
  setter = 0;
}
