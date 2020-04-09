/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if function typedef which returns nullable value is
 * exported from opted-in library to legacy library and then back to the opted
 * in code, it retains its status. Typedef is in the form [typedef <type>
 * <identifier> <formalParameterPart>].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

typedef exp_getNullableInt      = int? Function();
typedef exp_getNullableObject   = Object? Function();
typedef exp_getDynamic          = dynamic Function();
typedef exp_getNullableFunction = Function? Function();
typedef exp_getNull             = Null Function();
typedef exp_getFutureOr         = FutureOr Function();

main() {
  Expect.equals(exp_getNullableInt,      def1_getNullableInt);
  Expect.equals(exp_getNullableObject,   def1_getNullableObject);
  Expect.equals(exp_getDynamic,          def1_getDynamic);
  Expect.equals(exp_getNullableFunction, def1_getNullableFunction);
  Expect.equals(exp_getNull,             def1_getNull);
  Expect.equals(exp_getFutureOr,         def1_getFutureOr);
}
