// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Class with no modifiers can be constructed, extended, implemented
/// but not mixed in and is not exhaustive
///
/// @description Checks that class with no modifiers is not exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

class _C {}
class ExtendsC1 extends _C {}
class ExtendsC2 extends _C {}

String test1(_C c) => switch (c) {
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsC1 _ => "ExtendsC1",
      ExtendsC2 _ => "ExtendsC2"
    };

String test2(Class c) => switch (c) {
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsClass1 _ => "ExtendsClass1",
      ExtendsClass2 _ => "ExtendsClass2"
    };

main() {
  test1(ExtendsC1());
  test2(ExtendsClass1());
}
