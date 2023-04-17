// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class or enum declaration D from
/// library L has S from library K as a declared mixin, unless:
/// - S is a mixin or mixin class declaration (necessarily from a post-feature
///   library), or
/// - S is a non-mixin class declaration which has Object as superclass and
///   declares no generative constructor, and either
///   - K is a pre-feature library, or
///   - K is a platform library and L is a pre-feature library.
///
/// @description Check that it is a compile-time error if an enum declaration
/// mixes in class not declared as `mixin`. Test the case when mixed in classes
/// defined in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

class Class {}
base class BaseClass {}
interface class InterfaceClass {}
final class FinalClass {}
abstract class AbstractClass {}
sealed class SealedClass {}
abstract base class AbstractBaseClass {}
abstract interface class AbstractInterfaceClass {}
abstract final class AbstractFinalClass {}

enum E1 with Class {
//           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum E2 with BaseClass {
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum E3 with InterfaceClass {
//           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum E4 with FinalClass {
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum E5 with SealedClass {
//           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum E6 with AbstractClass {
//           ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum E7 with AbstractBaseClass {
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum E8 with AbstractInterfaceClass {
//           ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum E9 with AbstractFinalClass {
//           ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
  print(E6);
  print(E7);
  print(E8);
  print(E9);
}
