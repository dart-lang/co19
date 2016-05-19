/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.fromIterable(Iterable<T> data)
 * Creates a single-subscription stream that gets its data from data.
 * @description Checks that created stream is single-subscription.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Stream s = new Stream.fromIterable([1, 2, 3]);

  Expect.isFalse(s.isBroadcast);
}

