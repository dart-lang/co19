/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> first
 * If this is empty throws a StateError.
 * Otherwise this method is equivalent to this.elementAt(0).
 * @description Checks that for non-empty stream, this.first is equivalent to this.elementAt(0).
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const VAL=123;

main() {
  MessageBox mbox=new MessageBox();
  IsolateSink sink=mbox.sink;
  IsolateStream stream=mbox.stream;

  sink.add(VAL);
  sink.close();

  asyncStart();
  stream.elementAt(0).then((value){
    Expect.equals(VAL, value);
    asyncEnd();
  });
}
