/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream.fromFutures(Iterable<Future<T>> futures)
 *    If no future is passed, the stream closes as soon as possible.
 *
 * @description Checks that the created stream contains no events except [done]
 * if no futures are supplied.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  AsyncExpect.events([], [], new Stream.fromFutures([]));
}
