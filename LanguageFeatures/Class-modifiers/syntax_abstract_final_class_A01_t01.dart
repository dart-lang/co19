// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract final class cannot be constructed, extended, implemented
/// or mixed in and is not exhaustive
///
/// @description Checks that `final class` cannot be constructed
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

abstract final class LocalAbstractFinalClass {}

main() {
  AbstractFinalClass();
//^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LocalAbstractFinalClass();
//^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
