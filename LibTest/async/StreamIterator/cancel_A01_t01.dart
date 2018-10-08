/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future cancel()
 * Cancels the stream iterator (and the underlying stream subscription) early.
 *
 * The stream iterator is automatically canceled if the moveNext future
 * completes with either false or an error.
 *
 * If you need to stop listening for values before the stream iterator is
 * automatically closed, you must call cancel to ensure that the stream is
 * properly closed.
 *
 * If moveNext has been called when the iterator is cancelled, its returned
 * future will complete with false as value, as will all further calls to
 * moveNext.
 *
 * Returns a future if the cancel-operation is not completed synchronously.
 * Otherwise returns null.
 *
 * @description Checks that call to cancel() makes subsequent call to moveNext()
 * complete with false as value.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

void check(List source, List expected) {
  List actual = new List();
  Stream stream = new Stream.fromIterable(source);
  StreamIterator streamIterator = new StreamIterator(stream);
  asyncStart();
  void step(bool hasNext) {
    if (!hasNext) {
      Expect.listEquals(expected, actual);
      asyncEnd();
      return;
    }
    if (streamIterator.current == null) {
      streamIterator.cancel();
    } else {
      actual.add(streamIterator.current);
    }
    streamIterator.moveNext().then(step);
  }
  streamIterator.moveNext().then(step);
}

main() {
  check([1, 2, 3, "end"], [1, 2, 3, "end"]);
  check([1, 2, null, 3, "end"], [1, 2]);
}
