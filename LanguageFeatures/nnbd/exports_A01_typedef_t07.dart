/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if function typedef which returns non-nullable value
 * is exported from opted-in library to legacy library and then back to the
 * opted in code, it retains its status. Typedef is in the form [typedef
 * <typeIdentifier> <typeParameters> = <functionType>].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

typedef exp_getInt         = int Function();
typedef exp_getObject      = Object Function();
typedef exp_getFunction    = Function Function();
typedef exp_getFutureOrInt = FutureOr<int> Function();

main() {
  Expect.equals(exp_getInt,         def_getInt);
  Expect.equals(exp_getObject,      def_getObject);
  Expect.equals(exp_getFunction,    def_getFunction);
  Expect.equals(exp_getFutureOrInt, def_getFutureOrInt);
}
