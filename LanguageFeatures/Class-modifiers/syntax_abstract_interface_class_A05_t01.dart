// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract interface class can be implemented but not constructed,
/// extended or mixed in and is not exhaustive
///
/// @description Checks that it is not an error to declare a mixin on an
/// `abstract interface class`
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

abstract interface class LocalAbstractInterfaceClass {}

mixin MixinOnAbstractInterfaceClass on AbstractInterfaceClass {}

base mixin BaseMixinOnAbstractInterfaceClass on AbstractInterfaceClass {}

mixin MixinOnLocalAbstractInterfaceClass on LocalAbstractInterfaceClass {}

base mixin BaseMixinOnLocalAbstractInterfaceClass
    on LocalAbstractInterfaceClass {}

main() {
  print(MixinOnAbstractInterfaceClass);
  print(BaseMixinOnAbstractInterfaceClass);
  print(MixinOnLocalAbstractInterfaceClass);
  print(BaseMixinOnLocalAbstractInterfaceClass);
}
