/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void addError(errorEvent)
 * Create an async error.
 * @description Checks that corresponding isolate stream listener receives an error.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

IsolateSink replyTo=null;

void main2() {
  stream.listen((var message) {
    if (replyTo==null) {
      Expect.isTrue(message is IsolateSink);
      replyTo=message;
    } else {
      replyTo.addError(message);
    }
  },
  onError: (error){
    replyTo.add(error);
  });
}

void main() {
  var msg1=123;
  var msg2=321;
  IsolateSink sink = streamSpawnFunction(main2);
  MessageBox mbox=new MessageBox();
  sink.add(mbox.sink); // initial
  sink.add(msg1); // would be returned as error
  sink.addError(msg2); // would be returned as data
  
  asyncMultiStart(2);
  mbox.stream.listen((message) {
    Expect.equals(msg2, message);
    asyncEnd();
  },
  onError: (error){
    Expect.equals(msg1, error);
    asyncEnd();
  });
}

