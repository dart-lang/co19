/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Completes the future with an error if the stream has an error event, or if
 * action throws.
 * @description Checks that the future is completed with error if the stream has
 * an error event.
 * @author kaigorodov
 */
library forEach_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s, Object expectedError) {
  AsyncExpect.error(expectedError, s.forEach((element) {}));
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([1, 2, 3, 4], isError:(v) => v==4), 4);
  List list = [];
  check(create([null, "2", -3, 4.0, list], isError:(v) => v==list), list);
  check(create([null, "2", -3, 4.0, list], isError:(v) => v==4.0), 4.0);
}
