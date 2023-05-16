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

class Class {}
base class BaseClass {}
interface class InterfaceClass {}
final class FinalClass {}
abstract class AbstractClass {}
sealed class SealedClass {}
abstract base class AbstractBaseClass {}
abstract interface class AbstractInterfaceClass {}
abstract final class AbstractFinalClass {}

typedef TypedefClass = Class;
typedef TypedefBaseClass = BaseClass;
typedef TypedefInterfaceClass = InterfaceClass;
typedef TypedefFinalClass = FinalClass;
typedef TypedefSealedClass = SealedClass;
typedef TypedefAbstractClass = AbstractClass;
typedef TypedefAbstractBaseClass = AbstractBaseClass;
typedef TypedefAbstractInterfaceClass = AbstractInterfaceClass;
typedef TypedefAbstractFinalClass = AbstractFinalClass;

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

enum TE1 with TypedefClass {
//            ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum TE2 with TypedefBaseClass {
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum TE3 with TypedefInterfaceClass {
//            ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum TE4 with TypedefFinalClass {
//            ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum TE5 with TypedefSealedClass {
//            ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum TE6 with TypedefAbstractClass {
//            ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum TE7 with TypedefAbstractBaseClass {
//            ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum TE8 with TypedefAbstractInterfaceClass {
//            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e
}

enum TE9 with TypedefAbstractFinalClass {
//            ^^^^^^^^^^^^^^^^^^^^^^^^^
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
  print(TE1);
  print(TE2);
  print(TE3);
  print(TE4);
  print(TE5);
  print(TE6);
  print(TE7);
  print(TE8);
  print(TE9);
}
