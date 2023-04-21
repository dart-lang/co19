// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin class can be constructed, extended, implemented and mixed
/// in but is not exhaustive
///
/// @description Checks that a `mixin class` is not exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

mixin class _M {}
class ExtendsM extends _M {}
class ImplementsM implements _M {}
class WithM with _M {}

String test1(_M c) => switch (c) {
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsM _ => "ExtendsM",
      ImplementsM _ => "ImplementsM",
      WithM _ => "WithM"
    };

String test2(MixinClass c) => switch (c) {
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsMixinClass _ => "ExtendsMixinClass",
      ImplementsMixinClass _ => "ImplementsMixinClass",
      WithMixinClass _ => "WithMixinClass"
    };

main() {
  test1(ExtendsM());
  test2(ExtendsMixinClass());
}
