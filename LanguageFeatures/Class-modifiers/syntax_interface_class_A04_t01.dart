// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Interface class can be constructed and implemented but not
/// extended or mixed in and is not exhaustive
///
/// @description Checks that `interface class` is not exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

interface class C {}
interface class ExtendsC1 extends C {}
interface class ExtendsC2 extends C {}
sealed class SealedExtendsC1 extends C {}
sealed class SealedExtendsC2 extends C {}

String test1(C c) => switch (c) {
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsC1 _ => "ExtendsC1",
      ExtendsC2 _ => "ExtendsC2",
      SealedExtendsC1 _ => "SealedExtendsC1",
      SealedExtendsC2 _ => "SealedExtendsC2"
    };

String test2(InterfaceClass c) => switch (c) {
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsInterfaceClass1 _ => "ExtendsInterfaceClass1",
      ExtendsInterfaceClass2 _ => "ExtendsInterfaceClass2",
      SealedExtendsInterfaceClass1 _ => "SealedExtendsInterfaceClass1",
      SealedExtendsInterfaceClass2 _ => "SealedExtendsInterfaceClass2"
    };

main() {
  test1(ExtendsC1());
  test2(ExtendsInterfaceClass1());
}
