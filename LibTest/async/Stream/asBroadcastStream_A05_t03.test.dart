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
 * @description Checks Stream interface methods
 * @author a.semenov@unipro.ru
 */
library asBroadcastStream_A05_t03;
import "dart:async";
import "../../../Utils/expect.dart";
import "allTests_A03.lib.dart" as StreamTests;

void test(CreateStreamFunction create) {
  Stream s = create([]);
  if (!s.isBroadcast){
    StreamTests.test(<T>(Iterable<T> data) => create(data).asBroadcastStream());
  }
}
