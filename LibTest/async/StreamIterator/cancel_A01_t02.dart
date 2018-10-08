/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that call to cancel() completes with false future
 * returned by moveNext(), that was called prior cancel().
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  StreamIterator streamIterator = new StreamIterator(controller.stream);
  streamIterator.moveNext().then((value) {
    Expect.isFalse(value);
    asyncEnd();
  });

  asyncStart();
  streamIterator.cancel();
}
