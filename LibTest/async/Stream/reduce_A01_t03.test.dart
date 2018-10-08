/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> reduce(T combine(T previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that if the stream contains no elements, the combine
 * method is not called and the future returns an error.
 * @note undocumented
 * @author kaigorodov
 */
library reduce_A01_t03;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.error((e) => e is Error, create([]).reduce((p,e) => 0));
}
