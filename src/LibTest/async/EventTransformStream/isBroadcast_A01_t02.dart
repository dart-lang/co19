/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isBroadcast
 * Reports whether this stream is a broadcast stream.
 * @description Checks true is returned for a broadcast stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

main() {
  Stream stream=new Stream.fromIterable([]);
  MyTransformer t=new MyTransformer();
  EventTransformStream ets=new EventTransformStream(stream, t);

  EventTransformStream bs=ets.asBroadcastStream();
  
  Expect.isTrue(bs.isBroadcast);
}

