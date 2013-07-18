/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void close()
 * Closing multiple times is allowed.
 * @description Checks that corresponding stream listener receives onDone event.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  MessageBox mbox=new MessageBox();
  IsolateSink sink = mbox.sink;
  
  sink.close();
  
  asyncStart();
  mbox.stream.listen((message) {
    Expect.fail("unexpected data:$message");
  },
  onError: (error){
    Expect.fail("unexpected error:$error");
  },
  onDone: (){
    asyncEnd();
  });
}

