/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future firstWhere(bool test(T element), {Object defaultValue()})
 * If an error occurs, or if this stream ends without finding a match and with
 * no defaultValue function provided, the future will receive an error.
 * @description Checks that if an error occurs in the stream, the future
 * will receive that error.
 * @author kaigorodov
 */
library firstWhere_A03_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";

void test(CreateStreamWithErrorsFunction create) {
  Stream s = create([1,2,3,4,5], isError:(x) => x==4);
  AsyncExpect.error(4, s.firstWhere((v) => v==5));
}
