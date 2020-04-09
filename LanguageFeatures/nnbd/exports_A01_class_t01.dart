/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if generic class with nullable type parameter in
 * opted-in library is exported to legacy library and then back to the opted in
 * code, it retains its status, i.e. still its type parameter can be [Null].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.equals(dynamic, GENERIC_NULLABLE().getParamType());
  Expect.equals(Null,    GENERIC_NULLABLE<Null>().getParamType());

  Expect.equals(int,            GENERIC_NULLABLE_INT<int>().getParamType());
  Expect.equals(Null,           GENERIC_NULLABLE_INT<Null>().getParamType());
  Expect.equals(typeOf<int?>(), GENERIC_NULLABLE_INT().getParamType());

  Expect.equals(Object,            GENERIC_NULLABLE_OBJECT<Object>().getParamType());
  Expect.equals(Null,              GENERIC_NULLABLE_OBJECT<Null>().getParamType());
  Expect.equals(typeOf<Object?>(), GENERIC_NULLABLE_OBJECT().getParamType());

  Expect.equals(Function,            GENERIC_NULLABLE_FUNCTION<Function>().getParamType());
  Expect.equals(Null,                GENERIC_NULLABLE_FUNCTION<Null>().getParamType());
  Expect.equals(typeOf<Function?>(), GENERIC_NULLABLE_FUNCTION().getParamType());

  Expect.equals(Null, GENERIC_NULL().getParamType());
  Expect.equals(Null, GENERIC_NULL<Null>().getParamType());

  Expect.equals(FutureOr, GENERIC_FUTUREOR().getParamType());
  Expect.equals(FutureOr, GENERIC_FUTUREOR<FutureOr>().getParamType());
  Expect.equals(Null,     GENERIC_FUTUREOR<Null>().getParamType());
}
