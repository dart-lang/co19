/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * Returns the first element of the stream.
 * @description Checks that the first element is returned.
 * @author kaigorodov
 */
library first_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(123, create([123]).first);
  AsyncExpect.value(1, create([1,2,3]).first);
}
