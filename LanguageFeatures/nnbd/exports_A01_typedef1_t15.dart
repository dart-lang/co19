/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if generic function typedef with nullable type
 * parameter is exported from opted-in library to legacy library and then back
 * to the opted in code, typedef retains its status. Typedef is in the form
 * [typedef <type> <identifier> <formalParameterPart>]. Check function with
 * return value.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

typedef exp_getDynamic         <T>                   = T Function();
typedef exp_getNullableInt     <T extends int?>      = T Function();
typedef exp_getNullableObject  <T extends Object?>   = T Function();
typedef exp_getNullableFunction<T extends Function?> = T Function();
typedef exp_getNull            <T extends Null>      = T Function();
typedef exp_getFutureOr        <T extends FutureOr>  = T Function();

main() {
  Expect.equals(exp_getNullableInt,      g_def1_getNullableInt     );
  Expect.equals(exp_getNullableObject,   g_def1_getNullableObject  );
  Expect.equals(exp_getDynamic,          g_def1_getDynamic         );
  Expect.equals(exp_getNullableFunction, g_def1_getNullableFunction);
  Expect.equals(exp_getNull,             g_def1_getNull            );
  Expect.equals(exp_getFutureOr,         g_def1_getFutureOr        );
}
