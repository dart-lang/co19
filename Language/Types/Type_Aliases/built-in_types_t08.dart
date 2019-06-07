/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks logical operations
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../Utils/expect.dart';

typedef BoolAlias = bool;

main() {
  BoolAlias bat = true;
  BoolAlias baf = false;

  Expect.isFalse(bat && baf);
  Expect.isFalse(baf && bat);
  Expect.isTrue(true && bat);
  Expect.isFalse(bat && baf);

  Expect.isTrue(bat || baf);
  Expect.isTrue(baf || bat);
  Expect.isTrue(baf || true);
}
