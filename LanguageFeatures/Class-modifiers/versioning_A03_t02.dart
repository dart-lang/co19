// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any post-feature library declaration which has a platform library
/// class marked base or final as a superinterface must be marked base, final or
/// sealed, and cannot be implemented locally, even if the superinterface chain
/// goes through a pre-feature library declaration, and even if that declaration
/// ignores the base modifier.
///
/// @description Checks that it is a compile-time error if a declaration from a
/// post-future library is not marked `base`, `final` or `sealed` implements a
/// platform library class marked `final` and the superinterface chain goes
/// through a pre-feature library declaration
/// @author sgrekhov22@gmail.com

import "versioning_pre_feature_lib.dart";

class ClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {}
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {}
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {}
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {}
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {}
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {}
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsPreFeatureWithFinal implements PreFeatureWithFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnPreFeatureExtendsFinal on PreFeatureExtendsFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnPreFeatureImplementsFinal on PreFeatureImplementsFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnPreFeatureWithFinal on PreFeatureWithFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassImplementsPreFeatureExtendsFinal);
  print(ClassImplementsPreFeatureImplementsFinal);
  print(ClassImplementsPreFeatureWithFinal);
  print(InterfaceClassImplementsPreFeatureExtendsFinal);
  print(InterfaceClassImplementsPreFeatureImplementsFinal);
  print(InterfaceClassImplementsPreFeatureWithFinal);
  print(AbstractClassImplementsPreFeatureExtendsFinal);
  print(AbstractClassImplementsPreFeatureImplementsFinal);
  print(AbstractClassImplementsPreFeatureWithFinal);
  print(AbstractInterfaceClassImplementsPreFeatureExtendsFinal);
  print(AbstractInterfaceClassImplementsPreFeatureImplementsFinal);
  print(AbstractInterfaceClassImplementsPreFeatureWithFinal);
  print(MixinClassImplementsPreFeatureExtendsFinal);
  print(MixinClassImplementsPreFeatureImplementsFinal);
  print(MixinClassImplementsPreFeatureWithFinal);
  print(AbstractMixinClassImplementsPreFeatureExtendsFinal);
  print(AbstractMixinClassImplementsPreFeatureImplementsFinal);
  print(AbstractMixinClassImplementsPreFeatureWithFinal);
  print(MixinImplementsPreFeatureExtendsFinal);
  print(MixinImplementsPreFeatureImplementsFinal);
  print(MixinImplementsPreFeatureWithFinal);
  print(MixinOnPreFeatureExtendsFinal);
  print(MixinOnPreFeatureImplementsFinal);
  print(MixinOnPreFeatureWithFinal);
}
