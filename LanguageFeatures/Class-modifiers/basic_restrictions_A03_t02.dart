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
/// interface of a class marked `final` outside of the library where it is
/// declared
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class ImplementsFinalClass implements FinalClass {}
//                                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

abstract class AbstractImplementsFinalClass implements FinalClass {}
//                                                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

final class FinalImplementsFinalClass implements FinalClass {}
//                                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

base class BaseImplementsFinalClass implements FinalClass {}
//                                             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

sealed class SealedImplementsFinalClass implements FinalClass {}
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

interface class InterfaceImplementsFinalClass implements FinalClass {}
//                                                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class MixinImplementsFinalClass implements FinalClass {}
//                                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ImplementsFinalClass);
  print(AbstractImplementsFinalClass);
  print(FinalImplementsFinalClass);
  print(BaseImplementsFinalClass);
  print(SealedImplementsFinalClass);
  print(InterfaceImplementsFinalClass);
  print(MixinImplementsFinalClass);
}
