// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When the base, interface, final, mixin, or sealed modifiers are
/// placed on a class or mixin, the resulting restrictions apply to all other
/// libraries, even pre-feature libraries.
///
/// @description Checks that it is not an error if an `enum` declaration from a
/// pre-future library mixes in a `base mixin` from a post-feature library
/// (`enum` is implicitly final, so it's not an error)
/// @author sgrekhov22@gmail.com

// @dart=2.19

import "class_modifiers_lib.dart";

enum EnumWithBaseMixinClass with BaseMixinClass {e1, e2}

enum EnumWithAbstractBaseMixinClass with AbstractBaseMixinClass {e1, e2}

enum EnumWithBaseMixin with BaseMixin {e1, e2}

main() {
  print(EnumWithBaseMixinClass);
  print(EnumWithAbstractBaseMixinClass);
  print(EnumWithBaseMixin);
}
