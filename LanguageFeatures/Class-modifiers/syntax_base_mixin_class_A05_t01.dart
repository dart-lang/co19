// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin class can be constructed, extended, implemented and mixed
/// in but is not exhaustive
///
/// @description Checks that a `base mixin class` is not exhaustive
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

base mixin class _M {}
base class ExtendsM extends _M {}
final class ImplementsM implements _M {}
sealed class WithM with _M {}

String test1(_M c) => switch (c) {
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsM _ => "ExtendsM",
      ImplementsM _ => "ImplementsM",
      WithM _ => "WithM"
//            ^^
// [analyzer] STATIC_WARNING.UNREACHABLE_SWITCH_CASE
    };

String test2(BaseMixinClass c) => switch (c) {
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsBaseMixinClass _ => "ExtendsBaseMixinClass",
      ImplementsBaseMixinClass _ => "ImplementsBaseMixinClass",
      WithBaseMixinClass _ => "WithBaseMixinClass"
//                         ^^
// [analyzer] STATIC_WARNING.UNREACHABLE_SWITCH_CASE
    };

main() {
  test1(ExtendsM());
  test2(ExtendsBaseMixinClass());
}
