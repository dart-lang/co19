/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Completes the future with an error if the stream has an error event, or if action throws.
 * @description Checks that the future is completed with error if action throws.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer {
}

void check(Iterable it, var errValue) {
  Stream s=new Stream.fromIterable(it);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  Error err=new Error();
  asyncStart();
  Future f=ets.forEach((var element){
    if (element==errValue) {
      throw err;
    }
  });
  f.then((bool value){
      Expect.fail("unexpected call to onValue($value)");
    },
    onError:(Object error){
      Expect.identical(err, error);
      asyncEnd();
    }
  );
}

main() {
  check([1,2,3,4], 4);
  Map m={};
  check([null,"2",-3,4.0, m], m);
}
