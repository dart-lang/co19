/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if nullable unassigned variable in opted-in library
 * is exported to legacy library and then back to the opted in code, it retains
 * its status, i.e. its value is [null].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.isNull(nullable_i1);
  Expect.isNull(nullable_o1);
  Expect.isNull(d1);
  Expect.isNull(f1);
  Expect.isNull(n1);
  Expect.isNull(fo1);
  Expect.isNull(fofo1);
}
