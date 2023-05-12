// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract interface class can be implemented but not constructed,
/// extended or mixed in and is not exhaustive
///
/// @description Checks that an `abstract interface class` is not exhaustive
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

abstract interface class _C {}
interface class ExtendsC1 extends _C {}
interface class ExtendsC2 extends _C {}

String test1(_C c) => switch (c) {
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsC1 _ => "ExtendsC1",
      ExtendsC2 _ => "ExtendsC2",
    };

String test2(AbstractInterfaceClass c) => switch (c) {
//                                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsAbstractInterfaceClass1 _ => "ExtendsAbstractInterfaceClass1",
      ExtendsAbstractInterfaceClass2 _ => "ExtendsAbstractInterfaceClass2",
    };

main() {
  test1(ExtendsC1());
  test2(ExtendsAbstractInterfaceClass1());
}
