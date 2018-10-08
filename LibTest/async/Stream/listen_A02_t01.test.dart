/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamSubscription<T> listen(void onData(T event),
 *   {Function onError, void onDone(), bool cancelOnError})
 * Adds a subscription to this stream.
 * If onData is null, nothing happens.
 * @description Checks that onData can be null.
 * @author kaigorodov
 */
library listen_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s) {
  asyncStart();
  s.listen(null,
    onDone: () {
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([]));
  check(create([1, 2, 3, 4]));
  check(create([null, "2", -3, 4.0, []]));
}
