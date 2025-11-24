// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An augmenting variable’s initializing expression uses `augmented`, and the
/// stack of augmented declarations do not include a variable with an explicit
/// initializing expression. For nullable fields, the implicit null
/// initialization only happens if there is no explicit initializer after the
/// entire stack of augmentations has been applied.
///
/// @description Checks that it is still a compile-time error to have a final
/// variable with no initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_members_A05_t02_lib.dart';

final String? topLevelVariable;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static final String? staticVariable;
//                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final String? instanceVariable;
//              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static final String? staticVariable;
//                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final String? instanceVariable;
//              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static final String? staticVariable;
//                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final String? instanceVariable;
//              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static final String? staticVariable;
//                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(String _) {
  static final String? staticVariable;
//                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
