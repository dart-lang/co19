// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract class can be extended and implemented but not
/// constructed, mixed in and is not exhaustive
///
/// @description Check that it is not an error to declare a mixin `on` an
/// `abstract class`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

abstract class LocalAbstractClass {}

mixin MixinOnAbstractClass on AbstractClass {}

base mixin BaseMixinOnAbstractClass on AbstractClass {}

mixin MixinOnLocalAbstractClass on LocalAbstractClass {}

base mixin BaseMixinOnLocalAbstractClass on LocalAbstractClass {}

main() {
  print(MixinOnAbstractClass);
  print(BaseMixinOnAbstractClass);
  print(MixinOnLocalAbstractClass);
  print(BaseMixinOnLocalAbstractClass);
}
