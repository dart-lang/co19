/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if generic class with non-nullable type parameter in
 * opted-in library is exported to legacy library and then back to the opted in
 * code, its type parameter can be a type which is not [Null].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.equals(int, GENERIC_NONNULLABLE_INT().getParamType());
  Expect.equals(int, GENERIC_NONNULLABLE_INT<int>().getParamType());

  Expect.equals(Object, GENERIC_NONNULLABLE_OBJECT().getParamType());
  Expect.equals(Object, GENERIC_NONNULLABLE_OBJECT<Object>().getParamType());

  Expect.equals(Function, GENERIC_NONNULLABLE_FUNCTION().getParamType());
  Expect.equals(Function, GENERIC_NONNULLABLE_FUNCTION<Function>().getParamType());
}
