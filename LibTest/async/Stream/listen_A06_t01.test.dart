/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamSubscription<T> listen(void onData(T event),
 *   {Function onError, void onDone(), bool cancelOnError})
 * If this stream closes, the onDone handler is called.
 * @description Checks that if this stream closes, the onDone handler is called.
 * @author ilya
 */
library listen_A06_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  asyncStart();
  create([]).listen((_) {}, onDone: () {asyncEnd();});

  asyncStart();
  create([1]).listen((_) {}, onDone: () {asyncEnd();});

  asyncStart();
  Stream s = create([1]).asBroadcastStream();
  s.single.then((_) {});
  s.listen((_) {}, onDone: () {asyncEnd();});
}
