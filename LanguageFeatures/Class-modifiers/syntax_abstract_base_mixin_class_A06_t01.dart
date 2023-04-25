// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base mixin class can be extended and mixed in but not
/// constructed, implemented and is not exhaustive
///
/// @description Checks that an `abstrct base mixin class` is not exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

abstract base mixin class _M {}
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
// [analyzer] HINT.UNREACHABLE_SWITCH_CASE
    };

String test2(AbstractBaseMixinClass c) => switch (c) {
//                                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsAbstractBaseMixinClass _ => "ExtendsAbstractBaseMixinClass",
      ImplementsAbstractBaseMixinClass _ => "ImplementsAbstractBaseMixinClass",
      WithAbstractBaseMixinClass _ => "WithAbstractBaseMixinClass"
//                                 ^^
// [analyzer] HINT.UNREACHABLE_SWITCH_CASE
    };

main() {
  test1(ExtendsM());
  test2(ExtendsAbstractBaseMixinClass());
}
