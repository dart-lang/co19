/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.fromFuture(Future<T> future)
 * Creates a new single-subscription stream from the future.
 * @description Checks that created stream is single-subscription.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Future f = new Future.sync(() => 1);
  Stream s = new Stream.fromFuture(f);

  Expect.isFalse(s.isBroadcast);
}
