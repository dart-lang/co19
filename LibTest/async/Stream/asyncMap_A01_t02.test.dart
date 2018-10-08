/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream asyncMap(dynamic convert(T event))
 * Creates a new stream with each data event of this stream asynchronously
 * mapped to a new event.
 *
 * This acts like map, except that convert may return a Future, and in that
 * case, the stream waits for that future to complete before continuing with
 * its result.
 *
 * @description Checks that convert may return a Future.
 * @author ngl@unipro.ru
 */
library asyncMap_A01_t02;
import "dart:async";
import "../../../Utils/expect.dart";

dynamic convert(event) => new Future.value(event);

void test(CreateStreamFunction create) {
  AsyncExpect.data([], create([]).asyncMap(convert));
  AsyncExpect.data([1, 2, 3, 4], create([1, 2, 3, 4]).asyncMap(convert));
  AsyncExpect.data(
      [null, "2", -3, 4.0, []],
      create([null, "2", -3, 4.0, []]).asyncMap(convert)
  );
}
