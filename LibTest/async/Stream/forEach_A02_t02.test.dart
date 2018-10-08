/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Completes the future with an error if the stream has an error event, or if
 * action throws.
 * @description Checks that the future is completed with error if action throws.
 * @author kaigorodov
 */
library forEach_A02_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, Object errorElement) {
  Error expectedError = new Error();
  AsyncExpect.error(
      expectedError,
      s.forEach(
        (element) {
          if (element == errorElement) {
            throw expectedError;
          }
        }
      )
  );
}

void test(CreateStreamFunction create) {
  check(create([1, 2, 3, 4]), 4);
  Map m={};
  check(create([null, "2", -3, 4.0, m]), m);
  check(create([null, "2", -3, 4.0, m]), 4.0);
}
