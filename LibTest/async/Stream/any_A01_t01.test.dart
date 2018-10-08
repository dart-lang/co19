/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 * Completes the Future when the answer is known.
 * @description Checks that correct answer is passed to the future.
 * @author kaigorodov
 */
library any_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(false, create([]).any((element) => true));
  AsyncExpect.value(false, create([1, 2, 3]).any((int e) => e == null));
  AsyncExpect.value(true, create([1, 2, 3, null]).any((int e) => e == null));
  AsyncExpect.value(
      false,
      create(
          new Iterable<int>.generate(0, (int index) => index * 2)
      ).any((int element) => true)
  );
  AsyncExpect.value(
      true,
      create(
          new Iterable<int>.generate(10, (int index) => index * 5)
      ).any((int element) => element == 30)
  );
}
