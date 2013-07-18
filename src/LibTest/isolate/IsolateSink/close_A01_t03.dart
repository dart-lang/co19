/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void close()
 * Closing multiple times is allowed.
 * @description Checks that corresponding isolate stream listener receives onDone event.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

IsolateSink replyTo;

void main2() {
  stream.listen(
    (message) {
      Expect.isNull(replyTo);
      Expect.isTrue(message is IsolateSink);
      replyTo=(message as IsolateSink);
    },
    onError: (error){
      Expect.fail("unexpected onError($error)");
    },
    onDone: () {
      replyTo.add("ok");
      replyTo.close();
  });
}

void main() {
  IsolateSink sink = streamSpawnFunction(main2);
  MessageBox mbox=new MessageBox();

  sink.add(mbox.sink);
  sink.close();
  
  var lastMessage;
  
  asyncStart();
  mbox.stream.listen(
      (var message) {
        Expect.equals("ok", message);
        lastMessage=message;
      },
      onError: (error){
        Expect.fail("unexpected onError($error)");
      },
      onDone: (){
        Expect.isNotNull(lastMessage);
        mbox.stream.close();
        asyncEnd();
      }
  );
}