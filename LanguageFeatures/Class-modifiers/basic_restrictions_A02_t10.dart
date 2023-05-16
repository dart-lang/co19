// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A class extends or mixes in a declaration marked interface or final from
///   another library.
///
/// @description Check that it is a compile-time error if class marked
/// `abstract interface` is extended outside of the library where it is declared
/// Test type aliases
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ExtendsInterface extends TypedefAbstractInterfaceClass {}
//                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseExtendsInterface extends TypedefAbstractInterfaceClass {}
//                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsInterface extends TypedefAbstractInterfaceClass {}
//                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalExtendsInterface extends TypedefAbstractInterfaceClass {}
//                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedExtendsInterface extends TypedefAbstractInterfaceClass {}
//                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsInterface extends TypedefAbstractInterfaceClass {}
//                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseExtendsInterface extends TypedefAbstractInterfaceClass {}
//                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsInterface extends TypedefAbstractInterfaceClass {}
//                                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalExtendsInterface extends TypedefAbstractInterfaceClass {}
//                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef LocalTypedefAbstractInterfaceClass = AbstractInterfaceClass;

class ExtendsLocalTypedefAbstractInterfaceClass extends LocalTypedefAbstractInterfaceClass {}
//                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsInterface);
  print(BaseExtendsInterface);
  print(InterfaceExtendsInterface);
  print(FinalExtendsInterface);
  print(SealedExtendsInterface);
  print(AbstractExtendsInterface);
  print(AbstractBaseExtendsInterface);
  print(AbstractInterfaceExtendsInterface);
  print(AbstractFinalExtendsInterface);
  print(ExtendsLocalTypedefAbstractInterfaceClass);
}
