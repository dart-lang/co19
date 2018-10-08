/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isEmpty
 * If the first event is an error, the returned future is completed with that
 * error.
 * @description Checks that returned future is completed with the first error,
 * that appears in the stream
 * @issue #29730
 * @author a.semenov@unipro.ru
 */
library isEmpty_A03_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  AsyncExpect.value(true, create([]).isEmpty);
  AsyncExpect.error(1, create([1, 2, 3, null], isError:(x) => x==1).isEmpty);
  AsyncExpect.value(false, create([1, 2, 3, null], isError:(x) => x==3).isEmpty);
}
