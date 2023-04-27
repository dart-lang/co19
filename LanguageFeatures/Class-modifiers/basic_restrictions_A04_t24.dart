// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration has a base or final superdeclaration, and is not itself
///   marked base, final or sealed.
///
/// @description Check that it is a compile-time error if a declaration is not
/// `base`, `final` or `sealed` and has a superdeclaration marked `final`. Test
/// a type alias of a `final` superdeclaration in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

final class FinalClass {}

typedef TypedefFinalClass = FinalClass;

class ExtendsFinalClass extends TypedefFinalClass {}
//    ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsFinalClass extends TypedefFinalClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsFinalClass extends TypedefFinalClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsFinalClass extends TypedefFinalClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ImplementsFinalClass implements TypedefFinalClass {}
//    ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsFinalClass implements TypedefFinalClass {}
//              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsFinalClass implements TypedefFinalClass {}
//             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceImplementsFinalClass implements TypedefFinalClass {}
//                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnFinalClass on TypedefFinalClass {}
//    ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinImplementsFinalClass implements TypedefFinalClass {}
//    ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinClassImplementsFinalClass implements TypedefFinalClass {}
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract mixin class AbstractMixinClassImplementsFinalClass implements TypedefFinalClass {}
//                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsFinalClass);
  print(InterfaceExtendsFinalClass);
  print(AbstractExtendsFinalClass);
  print(AbstractInterfaceExtendsFinalClass);
  print(ImplementsFinalClass);
  print(InterfaceImplementsFinalClass);
  print(AbstractImplementsFinalClass);
  print(AbstractInterfaceImplementsFinalClass);
  print(MixinOnFinalClass);
  print(MixinImplementsFinalClass);
  print(MixinClassImplementsFinalClass);
  print(AbstractMixinClassImplementsFinalClass);
}
