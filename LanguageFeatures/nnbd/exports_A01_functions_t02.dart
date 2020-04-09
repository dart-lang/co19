/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if function with nullable argument is exported from
 * opted-in library to legacy library and then back to the opted in code, it
 * retains its status and can accept [null] arguments.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.isTrue(test_nullable_int_arg is void Function(int?));
  test_nullable_int_arg(null);

  Expect.isTrue(test_nullable_object_arg is void Function(Object?));
  test_nullable_object_arg(null);

  Expect.isTrue(test_null_arg is void Function(Null));
  test_null_arg(null);

  Expect.isTrue(test_futureOr_arg is void Function(FutureOr));
  test_futureOr_arg(null);
}
