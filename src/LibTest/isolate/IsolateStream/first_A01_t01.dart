/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> first
 * Returns the first element.
 * @description Checks that the first element is returned.
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
  stream.first.then((value){
    Expect.equals(VAL, value);
    asyncEnd();
  });
}
