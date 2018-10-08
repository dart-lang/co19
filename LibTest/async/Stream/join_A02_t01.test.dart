/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> join([String separator = ""])
 * Any error in the stream causes the future to complete with that error.
 * Otherwise it completes with the collected string when the "done" event
 * arrives.
 * @description Checks that an error in a stream causes the future to complete
 * with that error.
 * @author ilya
 */
library join_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  Error error = new Error();
  Stream s = create([1, 2, error, 4, 5], isError: (e) => e is Error);

  AsyncExpect.error(error, s.join());
}
