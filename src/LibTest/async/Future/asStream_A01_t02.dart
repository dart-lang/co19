/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Stream<T> asStream()
 * Creates a Stream that sends this' completion value, data or error, to its subscribers.
 * @description Checks that the stream sends this' error to its subscribers.
 * @author kaigorodov
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  Error error=new Error();
  Future future = new Future.sync((){throw error;});
  Stream stream=future.asStream();
  Future f2=stream.single;

  asyncStart();
  f2.then((fValue) {
    Expect.fail("unexpected value=$fValue");
  },
  onError: (Error e){
    Expect.equals(error, e);
    asyncEnd();
  }
  );
}
