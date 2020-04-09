/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if generic function typedef with non-nullable type
 * parameter is exported from opted-in library to legacy library and then back
 * to the opted in code, typedef retains its status. Typedef is in the form
 * [typedef <type> <identifier> <formalParameterPart>]. Check function with
 * return value.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

typedef exp_getInt     <T extends int>      = T Function();
typedef exp_getObject  <T extends Object>   = T Function();
typedef exp_getFunction<T extends Function> = T Function();

main() {
  Expect.equals(exp_getInt,      g_def1_getInt     );
  Expect.equals(exp_getObject,   g_def1_getObject  );
  Expect.equals(exp_getFunction, g_def1_getFunction);
}
