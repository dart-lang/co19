/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if non-null variable of nullable type from opted-in
 * library is exported to legacy library and then back to the opted in code, it
 * retains its status and so can be assigned to [null].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  nullable_i3 = null;
  Expect.isNull(nullable_i3);
  nullable_o3 = null;
  Expect.isNull(nullable_o3);
  d3 = null;
  Expect.isNull(d3);
  f3 = null;
  Expect.isNull(f3);
  fo3 = null;
  Expect.isNull(fo3);
  fofo3 = null;
  Expect.isNull(fofo3);
}
