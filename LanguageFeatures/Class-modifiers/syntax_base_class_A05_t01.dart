// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base class can be constructed and extended but not implemented,
/// mixed in and is not exhaustive
///
/// @description Checks that `base class` is not exhaustive
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

base class C {}
base class ExtendsC1 extends C {}
base class ExtendsC2 extends C {}

String test1(C c) => switch (c) {
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsC1 _ => "ExtendsC1",
      ExtendsC2 _ => "ExtendsC2",
    };

String test2(BaseClass c) => switch (c) {
//                           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      BaseExtendsBaseClass1 _ => "BaseExtendsBaseClass1",
      BaseExtendsBaseClass2 _ => "BaseExtendsBaseClass2",
    };

main() {
  test1(ExtendsC1());
  test2(BaseExtendsBaseClass1());
}
