/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> length
 *    If the stream contains an error, the returned future is completed with
 * that error, and processing stops.
 * @description Checks that If the stream contains an error, the returned
 * future is completed with that error, and processing stops
 * @author a.semenov@unipro.ru
 */
library length_A02_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  AsyncExpect.error(1, create([1], isError:(_) => true).length);
  AsyncExpect.error(3, create([1, 2, 3, null], isError:(e) => e==3).length);
  AsyncExpect.error(
    12,
    create(
      new Iterable.generate(10, (int i) => i * 2), isError:(e) => e > 10
    ).length
  );
}
