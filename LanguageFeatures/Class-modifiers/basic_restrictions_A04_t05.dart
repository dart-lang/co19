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
/// `final` superdeclaration in another library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ExtendsFinalClass extends FinalClass {}
//                              ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsFinalClass extends FinalClass {}
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsFinalClass extends FinalClass {}
//                                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsFinalClass extends FinalClass {}
//                                                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin MixinOnFinalClass on FinalClass {}
//                         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsFinalClass);
  print(InterfaceExtendsFinalClass);
  print(AbstractExtendsFinalClass);
  print(AbstractInterfaceExtendsFinalClass);
  print(MixinOnFinalClass);
}
