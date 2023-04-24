// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base class can be extended but not constructed,
/// implemented or mixed in and is not exhaustive
///
/// @description Check that it is not an error to declare a `base mixin` on an
/// `abstract base class`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "class_modifiers_lib.dart";

abstract base class LocalAbstractBaseClass {}

base mixin BaseMixinOnAbstractBaseClass on AbstractBaseClass {}

base mixin BaseMixinOnLocalAbstractBaseClass on LocalAbstractBaseClass {}

main() {
  print(BaseMixinOnAbstractBaseClass);
  print(BaseMixinOnLocalAbstractBaseClass);
}
