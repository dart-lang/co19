/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if nullable type alias exported from opted-in library
 * to legacy library and then back to the opted in code, its variable can be
 * assigned to [null].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong

import "../../../Utils/expect.dart";
import "exports_A01_opted_out_aliases_lib.dart";

main() {
  NullableAAlias        a = null;
  NullableIntAlias      i = null;
  NullableFunctionAlias f = null;
  NullableObjectAlias   o = null;
  DynamicAlias          d = null;
  NullAlias             n = null;
  FutureOrAlias         x = null;
  FutureOrFutureOrAlias y = null;

  Expect.isNull(a);
  Expect.isNull(i);
  Expect.isNull(f);
  Expect.isNull(o);
  Expect.isNull(d);
  Expect.isNull(x);
  Expect.isNull(y);
  Expect.isNull(n);
}
