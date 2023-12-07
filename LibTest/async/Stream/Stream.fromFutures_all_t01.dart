// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  Stream.fromFutures(Iterable<Future<T>> futures)
///    Create a stream from a group of futures.
///    The stream reports the results of the futures on the stream in the order
///  in which the futures complete.
///    If some futures have completed before calling Stream.fromFutures,
///  their result will be output on the created stream in some unspecified order.
///    When all futures have completed, the stream is closed.
///    If no future is passed, the stream closes as soon as possible.
/// @description Checks Stream interface methods
/// @author a.semenov@unipro.ru

import "dart:async";
import "allTests_A01.lib.dart" as all;

Stream<T> create<T>(Iterable<T> data) {
  return new Stream.fromFutures(data.map((T x) => new Future.value(x)));
}

main() {
  all.test(create);
}
