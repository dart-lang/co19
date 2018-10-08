/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> join([String separator = ""])
 * Any error in the stream causes the future to complete with that error.
 * Otherwise it completes with the collected string when the "done" event
 * arrives.
 * @description Checks that future completes with correct value when stream
 * done event arrives.
 * @author ilya
 */
library join_A02_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  Stream s = create([1, 2, 3]).asBroadcastStream();

  AsyncExpect.value('123', s.join());
  AsyncExpect.data([1, 2, 3], s);
}
