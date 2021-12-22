// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an unmigrated library re-exports a migrated library, the
/// re-exported symbols retain their migrated status (that is, downstream
/// migrated libraries will see their migrated types).
/// @description Check that if function with non-nullable argument is exported
/// from opted-in library to legacy library and then back to the opted in code,
/// it retains its status and can accept non-null arguments.
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "dart:async";
import "../../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.isTrue(test_int_arg is void Function(int));
  checkType(checkIs<void Function(int)>, true, test_int_arg);
  test_int_arg(1);

  Expect.isTrue(test_object_arg is void Function(Object));
  checkType(checkIs<void Function(Object)>, true, test_object_arg);
  test_object_arg(1);

  Expect.isTrue(test_function_arg is void Function(Function));
  checkType(checkIs<void Function(Function)>, true, test_function_arg);
  test_function_arg(testme);

  Expect.isTrue(test_futureOrInt_arg is void Function(FutureOr<int>));
  checkType(checkIs<void Function(FutureOr<int>)>, true, test_futureOrInt_arg);
  test_futureOrInt_arg(1);
}
