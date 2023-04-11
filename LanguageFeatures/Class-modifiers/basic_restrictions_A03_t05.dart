// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration implements another declaration, and the other declaration
///   itself, or any of its super-declarations, are marked base or final and are
///   not from the first declaration's library
///
/// @description Check that it is a compile-time error to indirectly implement
/// an interface of a class which have a super-declaration marked `base`,
/// outside of the library where it is declared
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

base class ExtendsBaseClass extends BaseClass {}

base class IndirectlyImplementsBaseClass implements ExtendsBaseClass {}
//                                                  ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalIndirectlyImplementsBaseClass implements ExtendsBaseClass {}
//                                                        ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedIndirectlyImplementsBaseClass implements ExtendsBaseClass {}
//                                                          ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin MixinIndirectlyImplementsBaseClass implements ExtendsBaseClass {}
//                                                       ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base mixin class MixinClassIndirectlyImplementsBaseClass implements ExtendsBaseClass {}
//                                                                  ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum EnumIndirectlyImplementsBaseClass implements ExtendsBaseClass {e1, e2}
//                                                ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(IndirectlyImplementsBaseClass);
  print(FinalIndirectlyImplementsBaseClass);
  print(SealedIndirectlyImplementsBaseClass);
  print(MixinIndirectlyImplementsBaseClass);
  print(MixinClassIndirectlyImplementsBaseClass);
  print(EnumIndirectlyImplementsBaseClass);
}
