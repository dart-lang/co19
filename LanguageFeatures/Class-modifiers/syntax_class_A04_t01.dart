// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Class with no modifiers can be constructed, extended, implemented
/// but not mixed in and is not exhaustive
///
/// @description Checks mixin can be declared on a class with no modifiers
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

class LocalClass {}

mixin MixinOnClass on Class {}

base mixin BaseMixinOnClass on Class {}

mixin MixinOnLocalClass on LocalClass {}

base mixin BaseMixinOnLocalClass on LocalClass {}

main() {
  print(MixinOnClass);
  print(BaseMixinOnClass);
  print(MixinOnLocalClass);
  print(BaseMixinOnLocalClass);
}
