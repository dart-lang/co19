/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if function which returns non-nullable is exported
 * from opted-in library to legacy library and then back to the opted in code,
 * it retains its status.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.isTrue(getInt is int Function());
  Expect.equals(1, getInt());

  Expect.isTrue(getObject is Object Function());
  Expect.equals(1, getObject());

  Expect.isTrue(getFunction is Function Function());
  Expect.equals(testme, getFunction());

  Expect.isTrue(getFutureOrInt is FutureOr<int> Function());
  Expect.equals(1, getFutureOrInt());
}
