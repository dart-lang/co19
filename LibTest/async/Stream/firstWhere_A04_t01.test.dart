/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future firstWhere(bool test(T element), {Object defaultValue()})
 *    Finds the first element of this stream matching test.
 *    Stops listening to the stream after the first matching element has been
 * received.
 *    Internally the method cancels its subscription after the first element
 * that matches the predicate. This means that single-subscription
 * (non-broadcast) streams are closed and cannot be reused after a call
 * to this method.
 * @description Checks that non broadcast stream can not be listened after
 * the first element is returned.
 * @author a.semenov@unipro.ru
 */
library firstWhere_A04_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s) {
  asyncStart();
  s.firstWhere((_)=>true).then(
    (_) {
      if (!s.isBroadcast){
        Expect.throws(() => s.listen((_){}));
      }
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([123]));
  check(create([1,2,3]));
}
