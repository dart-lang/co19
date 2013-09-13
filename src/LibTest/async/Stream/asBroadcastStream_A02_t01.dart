/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asBroadcastStream()
 * Returns a multi-subscription stream that produces the same events as this.
 * If this stream is already a broadcast stream, it is returned unmodified.
 * @description Checks that if this stream is already a broadcast stream,
 * returned stream is unmodified this stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}
  
class MyStream extends EventTransformStream {
  MyStream(Stream<int> source, StreamEventTransformer<int, int> transformer):super(source, transformer);
  
  bool get isBroadcast => true;
}

main() {
  Stream<int> stream=new Stream<int>.fromIterable([1,2,3]);
  MyTransformer t=new MyTransformer();
  Stream s1=new MyStream(stream, t);
  Stream s2=s1.asBroadcastStream();
  
  Expect.identical(s1, s2);
}

