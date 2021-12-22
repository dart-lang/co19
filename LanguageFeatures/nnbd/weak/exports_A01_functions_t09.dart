// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an unmigrated library re-exports a migrated library, the
/// re-exported symbols retain their migrated status (that is, downstream
/// migrated libraries will see their migrated types).
/// @description Check that if function which returns nullable is exported from
/// opted-in library to legacy library and then back to the opted in code, it
/// retains its status and so can return [null].
/// @author iarkh@unipro.ru

// Requirements=nnbd-weak

import "dart:async";
import "../../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.isTrue(getNullableInt is int? Function());
  checkType(checkIs<int? Function()>, true, getNullableInt);
  Expect.isNull(getNullableInt());

  Expect.isTrue(getNullableObject is Object? Function());
  checkType(checkIs<Object? Function()>, true, getNullableObject);
  Expect.isNull(getNullableObject());

  Expect.isTrue(getDynamic is dynamic Function());
  checkType(checkIs<dynamic Function()>, true, getDynamic);
  Expect.isNull(getDynamic());

  Expect.isTrue(getNullableFunction is Function? Function());
  checkType(checkIs<Function? Function()>, true, getNullableFunction);
  Expect.isNull(getNullableFunction());

  Expect.isTrue(getNull is Null Function());
  checkType(checkIs<Null Function()>, true, getNull);
  Expect.isNull(getNull());

  Expect.isTrue(getFutureOr is FutureOr Function());
  checkType(checkIs<FutureOr Function()>, true, getFutureOr);
  Expect.isNull(getFutureOr());
}
