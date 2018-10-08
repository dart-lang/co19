/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 *    Stops listening to the stream after the first element has been received.
 *    Internally the method cancels its subscription after the first element.
 * This means that single-subscription (non-broadcast) streams are closed and
 * cannot be reused after a call to this getter.
 * @description Checks that non broadcast stream can not be listened after
 * the first element is returned.
 * @author a.semenov@unipro.ru
 */
library first_A04_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s) {
  asyncStart();
  s.first.then(
    (_) {
      if (!s.isBroadcast){
        Expect.throws(() => s.listen((_){}));
      }
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([123]));
  check(create([1,2,3]));
}
