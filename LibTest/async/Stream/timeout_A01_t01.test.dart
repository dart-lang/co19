/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream timeout(Duration timeLimit,
 *                           {void onTimeout(EventSink sink)})
 * Creates a new stream with the same events as this stream.
 *
 * @description Check that timeout creates a new stream with the same events as
 * this stream.
 * @author ngl@unipro.ru
 */
library timeout_A01_t01;
import "../../../Utils/expect.dart";

const Duration _10DAYS = const Duration(days:10);

void test(CreateStreamFunction create) {
  AsyncExpect.data([], create([]).timeout(_10DAYS));
  AsyncExpect.data([1, 2, 3, null], create([1, 2, 3, null]).timeout(_10DAYS));
  List<int> data = new List<int>.generate(10, (int index) => index * 2);
  AsyncExpect.data(data, create(data).timeout(_10DAYS));

  AsyncExpect.data(
      ["a", "b", "c", 3.14, 100],
      create(["a", "b", "c", 3.14, 100]).timeout(_10DAYS)
  );
}
