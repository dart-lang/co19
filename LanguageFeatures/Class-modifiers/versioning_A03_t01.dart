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
/// post-feature library is not marked `base`, `final` or `sealed` extends a
/// platform library class marked `final` and the superinterface chain goes
/// through a pre-feature library declaration
/// @author sgrekhov22@gmail.com
/// @issue 52078

import "versioning_pre_feature_lib.dart";

class ClassExtendsPreFeatureExtendsFinal extends PreFeatureExtendsFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassExtendsPreFeatureImplementsFinal extends PreFeatureImplementsFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ClassExtendsPreFeatureWithFinal extends PreFeatureWithFinal {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassExtendsPreFeatureExtendsFinal extends PreFeatureExtendsFinal {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassExtendsPreFeatureImplementsFinal extends PreFeatureImplementsFinal {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceClassExtendsPreFeatureWithFinal extends PreFeatureWithFinal {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassExtendsPreFeatureExtendsFinal extends PreFeatureExtendsFinal {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassExtendsPreFeatureImplementsFinal extends PreFeatureImplementsFinal {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractClassExtendsPreFeatureWithFinal extends PreFeatureWithFinal {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassExtendsPreFeatureExtendsFinal extends PreFeatureExtendsFinal {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassExtendsPreFeatureImplementsFinal extends PreFeatureImplementsFinal {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceClassExtendsPreFeatureWithFinal extends PreFeatureWithFinal {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ClassExtendsPreFeatureExtendsFinal);
  print(ClassExtendsPreFeatureImplementsFinal);
  print(ClassExtendsPreFeatureWithFinal);
  print(InterfaceClassExtendsPreFeatureExtendsFinal);
  print(InterfaceClassExtendsPreFeatureImplementsFinal);
  print(InterfaceClassExtendsPreFeatureWithFinal);
  print(AbstractClassExtendsPreFeatureExtendsFinal);
  print(AbstractClassExtendsPreFeatureImplementsFinal);
  print(AbstractClassExtendsPreFeatureWithFinal);
  print(AbstractInterfaceClassExtendsPreFeatureExtendsFinal);
  print(AbstractInterfaceClassExtendsPreFeatureImplementsFinal);
  print(AbstractInterfaceClassExtendsPreFeatureWithFinal);
}
