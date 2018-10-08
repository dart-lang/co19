/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> reduce(T combine(T previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that if the stream contains single element, the combine
 * method is not called and that element is the result of the future.
 * @note undocumented
 * @author kaigorodov
 */
library reduce_A01_t02;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  int combine(int p, int e){
    Expect.fail("combine should not be called");
    return 0; // makes analyzer happy
  }

  AsyncExpect.value(
      777,
      create([777]).reduce(combine)
  );
}
