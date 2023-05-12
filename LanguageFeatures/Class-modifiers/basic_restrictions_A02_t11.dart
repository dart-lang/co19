// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A class extends or mixes in a declaration marked interface or final from
///   another library.
///
/// @description Check that it is a compile-time error if class marked `final`
/// is extended outside of the library where it is declared. Test type aliases
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class ExtendsFinal extends TypedefFinalClass {}
//                         ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseExtendsFinal extends TypedefFinalClass {}
//                                  ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceExtendsFinal extends TypedefFinalClass {}
//                                            ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalExtendsFinal extends TypedefFinalClass {}
//                                    ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedExtendsFinal extends TypedefFinalClass {}
//                                      ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractExtendsFinal extends TypedefFinalClass {}
//                                          ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract base class AbstractBaseExtendsFinal extends TypedefFinalClass {}
//                                                   ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract interface class AbstractInterfaceExtendsFinal extends TypedefFinalClass {}
//                                                             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract final class AbstractFinalExtendsFinal extends TypedefFinalClass {}
//                                                     ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ExtendsFinal);
  print(BaseExtendsFinal);
  print(InterfaceExtendsFinal);
  print(FinalExtendsFinal);
  print(SealedExtendsFinal);
  print(AbstractExtendsFinal);
  print(AbstractBaseExtendsFinal);
  print(AbstractInterfaceExtendsFinal);
  print(AbstractFinalExtendsFinal);
}
