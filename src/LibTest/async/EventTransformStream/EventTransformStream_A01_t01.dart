/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion EventTransformStream(Stream<S> source, StreamEventTransformer<S, T> transformer)
 * @description Checks that EventTransformStream instance can be created.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

void main() {
  Stream stream=new Stream.fromIterable([1,2,3]);
  MyTransformer t=new MyTransformer();
  EventTransformStream ets=new EventTransformStream(stream, t);
}