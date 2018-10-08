/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future drain([futureValue])
 * In case of a done event the future completes with the given futureValue.
 * @description Checks that the future completes with the given futureValue.
 * @author kaigorodov
 */
library drain_A02_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(-11, create([]).drain(-11));
  AsyncExpect.value(
    "abc",
    create(new Iterable.generate(10, (int index) => index)).drain("abc")
  );
}
