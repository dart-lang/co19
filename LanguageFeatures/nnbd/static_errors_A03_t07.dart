/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call an expression whose type is potentially
 * nullable and not dynamic.
 *
 * @description Check that it is a compile-time error to call an expression
 * whose type is potentially nullable and not dynamic. Test legacy function
 * types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "legacy_lib.dart";

main() {
  if (funcLegacy1 != null) {
    funcLegacy1.x();
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  if (funcLegacy2 != null) {
    funcLegacy2.x();
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
