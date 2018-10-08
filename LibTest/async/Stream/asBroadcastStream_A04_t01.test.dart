/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asBroadcastStream (
 *   {void onListen(StreamSubscription<T> subscription),
 *    void onCancel(StreamSubscription<T> subscription)})
 * Returns a multi-subscription stream that produces the same events as this.
 *
 * If onCancel is provided, it is called in a similar way to onListen when
 * the returned stream stops having listener. If it later gets a new listener,
 * the onListen function is called again.
 *
 * @description Checks that onCancel callback is called when broadcast stream
 * stops having listeners because the underlying stream ends.
 * @author ilya
 */
library asBroadcastStream_A04_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  Stream<int> s = create([1, 2, 3]);

  asyncStart();
  Stream<int> b = s.asBroadcastStream(
      onCancel: (StreamSubscription<int> subs) {
        asyncEnd();
      }
  );
  b.listen((_) {});
  b.listen((_) {});
  b.listen((_) {});
}
