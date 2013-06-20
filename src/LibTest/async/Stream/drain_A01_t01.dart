/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future drain([futureValue])
 * Discards all data on the stream, but signals when it's done or an error occured.
 * When subscribing using drain, cancelOnError will be true.
 * This means that the future will complete with the first error on the stream
 * and then cancel the subscription.
 * @description Checks that the future will complete with the very first error on the stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s) {
  Future f=s.drain();
  bool errorSeen=false;
  asyncStart();
  f.then(
    (value){
      Expect.fail("empty stream returned $value");
    },
    onError:(error){
      Expect.isFalse(errorSeen);
      Expect.isTrue(error is ArgumentError, error);
      Expect.isTrue((error as ArgumentError).message==1);      
      errorSeen=true;
      asyncEnd();
    }
  );
}

main() {
  check(new Stream.fromIterable(new Iterable.generate(10, (int index){throw new ArgumentError(index+1);})));
}
