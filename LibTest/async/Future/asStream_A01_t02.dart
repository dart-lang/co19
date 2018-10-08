/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asStream()
 * Creates a Stream containing the result of this future.
 * The stream will produce single data or error event containing the completion
 * result of this future, ...
 * @description Checks that the stream sends this' error to its subscribers.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Error error = new Error();
  Future future = new Future.sync(() {throw error;});
  Stream stream = future.asStream();
  Future f2 = stream.single;

  asyncStart();
  f2.then(
    (fValue) {
      Expect.fail("unexpected value=$fValue");
    },
    onError: (Error e){
      Expect.identical(error, e);
      asyncEnd();
    }
  );
}
