/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void addError(errorEvent)
 * Create an async error.
 * @description Checks that corresponding stream listener receives an error.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  var msg1=123;
  var msg2=321;
  MessageBox mbox=new MessageBox();
  IsolateSink sink = mbox.sink;
  
  sink.add(msg1); // would be returned as error
  sink.addError(msg2); // would be returned as data
  
  asyncMultiStart(2);
  mbox.stream.listen((message) {
    Expect.equals(msg2, message);
    asyncEnd();
  },
  onError: (error){
    Expect.equals(msg1, message);
    asyncEnd();
  });
}

