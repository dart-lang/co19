/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a top level variable, static variable, or
 * instance field with potentially non-nullable type has no initializer
 * expression and is not initialized in a constructor via an initializing formal
 * or an initializer list entry, unless the variable or field is marked with the
 * 'late' modifier.
 *
 * @description Check that it is not an error if a top level variable, static
 * variable, or instance field with potentially non-nullable type has no
 * initializer expression but marked with a 'late' modifier. Test F*, where F
 * is a function type
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "legacy_lib.dart";

late LegacyFoo x;

class C {
  static late LegacyFoo x1;
  static late final LegacyFoo x2;
  late LegacyFoo x3;
  late final LegacyFoo x4;
  covariant late LegacyFoo x5;
}

main() {
}
