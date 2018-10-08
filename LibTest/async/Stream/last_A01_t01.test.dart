/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> last
 * Returns the last element of the stream.
 * @description Checks that the last element is returned.
 * @author kaigorodov
 */
library last_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(123, create([123]).last);
  AsyncExpect.value(123, create([123/2, 123]).last);
  AsyncExpect.value(9, create(new Iterable.generate(10, (int i) => i)).last);
}
