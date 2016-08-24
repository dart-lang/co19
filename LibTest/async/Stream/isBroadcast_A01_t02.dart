/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isBroadcast
 * Reports whether this stream is a broadcast stream.
 * @description Checks true is returned for a broadcast stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

class MyStream<T> extends Stream<T> {
  StreamSubscription<T> listen(void onData(T event),
                   {Function onError, void onDone(), bool cancelOnError})
  {
    return null;
  }
}

main() {
  Stream s = new MyStream().asBroadcastStream();

  Expect.isTrue(s.isBroadcast);
}

