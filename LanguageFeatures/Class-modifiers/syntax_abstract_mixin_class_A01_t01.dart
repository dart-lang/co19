// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract mixin class can be extended, implemented and mixed in
/// but not constructed and is not exhaustive
///
/// @description Checks that an `abstract mixin class` cannot be constructed
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

abstract mixin class LocalAbstractMixinClass {}

main() {
  AbstractMixinClass();
//^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LocalAbstractMixinClass();
//^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
