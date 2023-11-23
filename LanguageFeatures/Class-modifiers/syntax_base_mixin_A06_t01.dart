// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin can be mixed in but not constructed, extended or
/// implemented and is not exhaustive
///
/// @description Checks that a `base mixin` is not exhaustive
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

base mixin _M {}
base class ImplementsM implements _M {}
final class WithM with _M {}

String test1(_M c) => switch (c) {
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ImplementsM _ => "ImplementsM",
      WithM _ => "WithM"
    };

String test2(BaseMixin c) => switch (c) {
//                           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ImplementsBaseMixin _ => "ImplementsBaseMixin",
      WithBaseMixin _ => "WithBaseMixin"
    };

main() {
  test1(ImplementsM());
  test2(ImplementsBaseMixin());
}
