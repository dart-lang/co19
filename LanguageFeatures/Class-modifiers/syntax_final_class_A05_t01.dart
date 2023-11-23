// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Final class can be constructed but not extended, implemented or
/// mixed in and is not exhaustive
///
/// @description Checks that `final class` is not exhaustive
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

final class _C {}
final class ExtendsC1 extends _C {}
final class ExtendsC2 extends _C {}

String test1(_C c) => switch (c) {
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsC1 _ => "ExtendsC1",
      ExtendsC2 _ => "ExtendsC2",
    };

String test2(FinalClass c) => switch (c) {
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsFinalClass1 _ => "ExtendsFinalClass1",
      ExtendsFinalClass2 _ => "ExtendsFinalClass2",
    };

main() {
  test1(ExtendsC1());
  test2(ExtendsFinalClass1());
}
