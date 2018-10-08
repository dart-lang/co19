/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> single
 * Returns the single element.
 * If an error event occurs before or after the first data event, the resulting
 * future is completed with that error.
 * @description Checks that an error event occurs before or after the first
 * data event, the resulting future is completed with that error.
 * @author ngl@unipro.ru
 */
library single_A03_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  AsyncExpect.error(1, create([1,2,3], isError: (_) => true).single);
  AsyncExpect.error(1, create([1,2,3], isError: (x) => x==1).single);
  AsyncExpect.error(2, create([1,2], isError: (x) => x==2).single);
  AsyncExpect.error(2, create([1,2,3], isError: (x) => x==2).single);
}
