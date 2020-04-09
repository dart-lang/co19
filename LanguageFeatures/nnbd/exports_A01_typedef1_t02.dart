/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if function typedef with argument of nullable type is
 * exported from opted-in library to legacy library and then back to the opted
 * in code, it retains its status. Typedef is in the form [typedef <type> <identifier>
 * <formalParameterPart>].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

typedef exp_nullable_int_arg      = void Function(int? i);
typedef exp_nullable_object_arg   = void Function(Object? i);
typedef exp_dynamic_arg           = void Function(dynamic i);
typedef exp_nullable_function_arg = void Function(Function? f);
typedef exp_null_arg              = void Function(Null n);
typedef exp_futureOr_arg          = void Function(FutureOr i);

main() {
  Expect.equals(exp_nullable_int_arg,      def1_nullable_int_arg);
  Expect.equals(exp_nullable_object_arg,   def1_nullable_object_arg);
  Expect.equals(exp_dynamic_arg,           def1_dynamic_arg);
  Expect.equals(exp_nullable_function_arg, def1_nullable_function_arg);
  Expect.equals(exp_null_arg,              def1_null_arg);
  Expect.equals(exp_futureOr_arg,          def1_futureOr_arg);
}
