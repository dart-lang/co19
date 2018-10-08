/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * Checks whether needle occurs in the elements provided by this stream.
 * @description Checks that the method correctly checks whether match
 * occurs in the elements provided by this stream.
 * @author kaigorodov
 */
library contains_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(false, create([]).contains(null));
  AsyncExpect.value(false, create([1, 2, []]).contains(null));
  AsyncExpect.value(true, create([1, 2, null, []]).contains(null));
  AsyncExpect.value(false, create([1, 2, []]).contains(4));
  AsyncExpect.value(true, create([1, 2, null, []]).contains(2));
}
