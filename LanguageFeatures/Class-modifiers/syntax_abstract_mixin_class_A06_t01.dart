// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract mixin class can be extended, implemented and mixed in
/// but not constructed and is not exhaustive
///
/// @description Checks that an `abstract mixin class` is not exhaustive
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

abstract mixin class _M {}
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

String test2(AbstractMixinClass c) => switch (c) {
//                                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ExtendsAbstractMixinClass _ => "ExtendsAbstractMixinClass",
      ImplementsAbstractMixinClass _ => "ImplementsAbstractMixinClass",
      WithAbstractMixinClass _ => "WithAbstractMixinClass"
    };

main() {
  test1(ExtendsM());
  test2(ExtendsAbstractMixinClass());
}
