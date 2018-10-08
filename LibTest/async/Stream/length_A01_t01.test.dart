/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> length
 *    The number of elements in this stream.
 *    Waits for all elements of this stream. When the stream ends, the returned
 * future is completed with the number of elements.
 * @description Checks that correct number of elements is returned.
 * @author kaigorodov
 */
library length_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(0, create([]).length);
  AsyncExpect.value(4, create([1, 2, 3, null]).length);
  AsyncExpect.value(0, create(new Iterable.generate(0, (int i) => i * 2)).length);
  AsyncExpect.value(10, create(new Iterable.generate(10, (int i) => i * 2)).length);
}
