/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if [null] variable in opted-in library is exported to
 * legacy library and then back to the opted in code, it retains its status and
 * still its value is [null].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.isNull(nullable_i2);
  Expect.isNull(nullable_o2);
  Expect.isNull(d2);
  Expect.isNull(f2);
  Expect.isNull(n2);
  Expect.isNull(fo2);
  Expect.isNull(fofo2);

  nullable_i2 = 1;
  Expect.equals(1, nullable_i2);
  nullable_o2 = 1;
  Expect.equals(1, nullable_o2);
  d2 = 1;
  Expect.equals(1, d2);
  f2 = testme;
  Expect.equals(testme, f2);
  fo2 = 1;
  Expect.equals(1, fo2);
  fofo2 = 1;
  Expect.equals(1, fofo2);
 }
