/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future fold(initialValue, combine(previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that if the stream contains no elements, the combine
 * method is not called and the future returns initialValue.
 * @note undocumented
 * @author kaigorodov
 */
library fold_A01_t02;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s, Object initialValue) {
  asyncStart();
  s.fold(initialValue, (p,c) => Expect.fail("should not be called")).then(
    (actual) {
      Expect.equals(initialValue, actual);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([]), null);
  check(create([]), 777);
  check(create([]), "");
}
