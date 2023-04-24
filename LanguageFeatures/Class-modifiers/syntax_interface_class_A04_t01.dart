// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Interface class can be constructed and implemented but not
/// extended or mixed in and is not exhaustive
///
/// @description Checks that it is not an error if a mixin is declared on an
/// `interface class`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

interface class LocalInterfaceClass {}

mixin MixinOnInterfaceClass on InterfaceClass {}

base mixin BaseMixinOnInterfaceClass on InterfaceClass {}

mixin MixinOnLocalInterfaceClass on LocalInterfaceClass {}

base mixin BaseMixinOnLocalInterfaceClass on LocalInterfaceClass {}

main() {
  print(MixinOnInterfaceClass);
  print(BaseMixinOnInterfaceClass);
  print(MixinOnLocalInterfaceClass);
  print(BaseMixinOnLocalInterfaceClass);
}
