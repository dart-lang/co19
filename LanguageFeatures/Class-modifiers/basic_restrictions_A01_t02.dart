// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A declaration depends directly on a sealed declaration from another
///   library.
///
/// @description Check that it is a compile-time error if class marked `sealed`
/// is extended outside of the library where it is declared
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

abstract class AbstractExtendsSealed extends SealedClass {}
//                                           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalExtendsSealed extends SealedClass {}
//                                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseExtendsSealed extends SealedClass {}
//                                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedExtendsSealed extends SealedClass {}
//                                       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsSealed extends SealedClass {}
//                                             ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinExtendsSealed extends SealedClass {}
//                                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(AbstractExtendsSealed);
  print(FinalExtendsSealed);
  print(BaseExtendsSealed);
  print(SealedExtendsSealed);
  print(InterfaceExtendsSealed);
  print(MixinExtendsSealed);
}
