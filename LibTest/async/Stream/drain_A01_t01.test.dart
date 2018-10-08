/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future drain([futureValue])
 *    Discards all data on the stream, but signals when it's done or an error
 * occurred.
 *    When subscribing using drain, cancelOnError will be true.
 * This means that the future will complete with the first error on the stream
 * and then cancel the subscription.
 * @description Checks that the future will complete with the first error
 * on the stream.
 * @author kaigorodov
 */
library drain_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  Stream<int> s = create([1,2,3,4,5], isError:(e) => true);
  AsyncExpect.error(1, s.drain());
}
