/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> takeWhile(bool test(T element))
 * Forwards data events while test is successful.
 * The returned stream provides the same events as this stream as long as test
 * returns true for the event data.
 * The stream is done when either this stream is done, or when this stream first
 * provides a value that test doesn't accept.
 * @description Checks that only first elements that passed the test are
 * returned.
 * @author kaigorodov
 * @author a.semenov@unipro.ru
 */
library takeWhile_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.data([], create([]).takeWhile(null));
  AsyncExpect.data(
      [-1, -2, -3],
      create([-1, -2, -3, 1, 2, 3, -1, -2, -3]).takeWhile((x) => x < 0)
  );
  AsyncExpect.data([1, 2, 3], create([1, 2, 3]).takeWhile((element) => true));
  AsyncExpect.data([1], create([1, 2, 3, 1]).takeWhile((element) => element == 1));
  AsyncExpect.data([], create([1, 2, 3]).takeWhile((element) => false));
}
