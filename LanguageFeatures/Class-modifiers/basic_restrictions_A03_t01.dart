// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A declaration implements another declaration, and the other declaration
///   itself, or any of its super-declarations, are marked base or final and are
///   not from the first declaration's library
///
/// @description Check that it is a compile-time error to implement the
/// interface of a class marked `base` outside of the library where it is
/// declared
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ImplementsBaseClass implements BaseClass {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsBaseClass implements BaseClass {}
//                                                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalImplementsBaseClass implements BaseClass {}
//                                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseImplementsBaseClass implements BaseClass {}
//                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedImplementsBaseClass implements BaseClass {}
//                                                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsBaseClass implements BaseClass {}
//                                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinImplementsBaseClass implements BaseClass {}
//                                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsBaseClass);
  print(AbstractImplementsBaseClass);
  print(FinalImplementsBaseClass);
  print(BaseImplementsBaseClass);
  print(SealedImplementsBaseClass);
  print(InterfaceImplementsBaseClass);
  print(MixinImplementsBaseClass);
}
