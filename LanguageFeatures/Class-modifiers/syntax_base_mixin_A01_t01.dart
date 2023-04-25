// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Base mixin can be mixed in but not constructed, extended or
/// implemented and is not exhaustive
///
/// @description Checks that a `base mixin` cannot be constructed
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

base mixin LocalBaseMixin {}

main() {
  BaseMixin();
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LocalBaseMixin();
//^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
