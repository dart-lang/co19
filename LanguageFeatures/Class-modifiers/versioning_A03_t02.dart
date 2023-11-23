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
/// post-feature library implements a platform library class marked `final` and
/// the superinterface chain goes through a pre-feature library declaration
/// @author sgrekhov22@gmail.com
/// @issue 52078

import "versioning_pre_feature_lib.dart";

class ClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

class ClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

class ClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

base class BaseClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

base class BaseClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

base class BaseClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

interface class InterfaceClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

interface class InterfaceClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

interface class InterfaceClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

final class FinalClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

final class FinalClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

final class FinalClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

sealed class SealedClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

sealed class SealedClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

sealed class SealedClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract class AbstractClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract class AbstractClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract class AbstractClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract base class AbstractBaseClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract base class AbstractBaseClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract base class AbstractBaseClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract interface class AbstractInterfaceClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract interface class AbstractInterfaceClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract interface class AbstractInterfaceClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract final class AbstractFinalClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract final class AbstractFinalClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract final class AbstractFinalClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

mixin class MixinClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

mixin class MixinClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

mixin class MixinClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

base mixin class BaseMixinClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

base mixin class BaseMixinClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

base mixin class BaseMixinClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract mixin class AbstractMixinClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract mixin class AbstractMixinClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract mixin class AbstractMixinClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract base mixin class AbstractBaseMixinClassImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract base mixin class AbstractBaseMixinClassImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

abstract base mixin class AbstractBaseMixinClassImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

mixin MixinImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

mixin MixinImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

mixin MixinImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

base mixin BaseMixinImplementsPreFeatureExtendsFinal implements PreFeatureExtendsFinal {
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

base mixin BaseMixinImplementsPreFeatureImplementsFinal implements PreFeatureImplementsFinal {
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

base mixin BaseMixinImplementsPreFeatureWithFinal implements PreFeatureWithFinal {
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) {}
}

main() {
  print(ClassImplementsPreFeatureExtendsFinal);
  print(ClassImplementsPreFeatureImplementsFinal);
  print(ClassImplementsPreFeatureWithFinal);
  print(BaseClassImplementsPreFeatureExtendsFinal);
  print(BaseClassImplementsPreFeatureImplementsFinal);
  print(BaseClassImplementsPreFeatureWithFinal);
  print(InterfaceClassImplementsPreFeatureExtendsFinal);
  print(InterfaceClassImplementsPreFeatureImplementsFinal);
  print(InterfaceClassImplementsPreFeatureWithFinal);
  print(FinalClassImplementsPreFeatureExtendsFinal);
  print(FinalClassImplementsPreFeatureImplementsFinal);
  print(FinalClassImplementsPreFeatureWithFinal);
  print(SealedClassImplementsPreFeatureExtendsFinal);
  print(SealedClassImplementsPreFeatureImplementsFinal);
  print(SealedClassImplementsPreFeatureWithFinal);
  print(AbstractClassImplementsPreFeatureExtendsFinal);
  print(AbstractClassImplementsPreFeatureImplementsFinal);
  print(AbstractClassImplementsPreFeatureWithFinal);
  print(AbstractBaseClassImplementsPreFeatureExtendsFinal);
  print(AbstractBaseClassImplementsPreFeatureImplementsFinal);
  print(AbstractBaseClassImplementsPreFeatureWithFinal);
  print(AbstractInterfaceClassImplementsPreFeatureExtendsFinal);
  print(AbstractInterfaceClassImplementsPreFeatureImplementsFinal);
  print(AbstractInterfaceClassImplementsPreFeatureWithFinal);
  print(AbstractFinalClassImplementsPreFeatureExtendsFinal);
  print(AbstractFinalClassImplementsPreFeatureImplementsFinal);
  print(AbstractFinalClassImplementsPreFeatureWithFinal);
  print(MixinClassImplementsPreFeatureExtendsFinal);
  print(MixinClassImplementsPreFeatureImplementsFinal);
  print(MixinClassImplementsPreFeatureWithFinal);
  print(BaseMixinClassImplementsPreFeatureExtendsFinal);
  print(BaseMixinClassImplementsPreFeatureImplementsFinal);
  print(BaseMixinClassImplementsPreFeatureWithFinal);
  print(AbstractMixinClassImplementsPreFeatureExtendsFinal);
  print(AbstractMixinClassImplementsPreFeatureImplementsFinal);
  print(AbstractMixinClassImplementsPreFeatureWithFinal);
  print(AbstractBaseMixinClassImplementsPreFeatureExtendsFinal);
  print(AbstractBaseMixinClassImplementsPreFeatureImplementsFinal);
  print(AbstractBaseMixinClassImplementsPreFeatureWithFinal);
  print(MixinImplementsPreFeatureExtendsFinal);
  print(MixinImplementsPreFeatureImplementsFinal);
  print(MixinImplementsPreFeatureWithFinal);
  print(BaseMixinImplementsPreFeatureExtendsFinal);
  print(BaseMixinImplementsPreFeatureImplementsFinal);
  print(BaseMixinImplementsPreFeatureWithFinal);
}
