// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract class can be extended and implemented but not
/// constructed, mixed in and is not exhaustive
///
/// @description Checks that `abstract class` is not exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

abstract class _C {}
class ExtendsC1 extends _C {}
class ExtendsC2 extends _C {}

String test1(_C c) => switch (c) {
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsC1 _ => "ExtendsC1",
      ExtendsC2 _ => "ExtendsC2"
    };

String test2(AbstractClass c) => switch (c) {
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsAbstractClass1 _ => "ExtendsAbstractClass1",
      ExtendsAbstractClass2 _ => "ExtendsAbstractClass2"
    };

main() {
  test1(ExtendsC1());
  test2(ExtendsAbstractClass1());
}
