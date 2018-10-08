/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> reduce(T combine(T previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that if [combine] throws error, then returned future is
 * completed with this error.
 * @author a.semenov@unipro.ru
 */
library reduce_A02_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.error("a", create([1, 2, 3]).reduce((p,e) => throw "a"));
  AsyncExpect.error(2, create([1, 2, 3]).reduce((p,e) => throw e));
  AsyncExpect.error(3,
      create([1, 2, 3, 4, 5]).reduce(
        (p, e) {
          if (e==3) throw e;
          return p + e;
        }
      )
  );
}
