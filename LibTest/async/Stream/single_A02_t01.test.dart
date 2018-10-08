/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> single
 * Returns the single element.
 * If this is empty or has more than one element throws a StateError.
 * @description Checks that a error is thrown if this is empty or has more
 * than one element.
 * @author kaigorodov
 */
library single_A02_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.error((e) => e is StateError, create([]).single);
  AsyncExpect.error((e) => e is StateError, create([1, 2]).single);
  AsyncExpect.error((e) => e is StateError, create(["a", "b", "c"]).single);
}
