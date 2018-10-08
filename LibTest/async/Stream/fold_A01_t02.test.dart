/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<S> fold<S>(S initialValue, S combine(S previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that if the stream contains no elements, the combine
 * method is not called and the future returns initialValue.
 * @note undocumented
 * @author kaigorodov
 */
library fold_A01_t02;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  Object combine(Object p, var c) {
    Expect.fail("should not be called");
    return 0;
  }

  AsyncExpect.value(null, create([]).fold(null, combine));
  AsyncExpect.value(777, create([]).fold(777, combine));
  AsyncExpect.value("", create([]).fold("", combine));
}
