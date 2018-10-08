/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Stream<T> asStream()
 * The stream will produce single data or error event containing the completion
 * result of this future, and then it will close with a done event.
 * @description Checks that the stream is closed after the completion value is
 * send.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

String output1;

main() {
  var value = 99;
  Future future = new Future.sync(()=>value);
  Stream stream = future.asStream();
  int count = 1;

  asyncStart();
  stream.listen(
    (var event){  // should be invoked first
    	count = count + 1;
    },
    onDone: () {
	    Expect.equals(2, count);
      asyncEnd();
    }   // should be invoked second
  );
}
