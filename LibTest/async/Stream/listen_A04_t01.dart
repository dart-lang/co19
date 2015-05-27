/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract StreamSubscription<T> listen(void onData(T event),
 *   {Function onError, void onDone(), bool cancelOnError})
 * If cancelOnError is true, the subscription is ended when the first error is reported.
 * The default is false.
 * @description Checks that if cancelOnError is true, the subscription is ended
 * when the first error is reported.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(List data) {
  var expected = data[0];
  Stream s1=new Stream.fromIterable(data);

  // make a Stream with only error events
  Stream s2=s1.where((var event){
       throw new ArgumentError(event);
    }); 

  bool firstErrorSeen=false;
  
  asyncStart();
  s2.listen((var event) {
      Expect.fail("unexpected call to onData($event)");
    },
    onError:(Object error) {
      Expect.isFalse(firstErrorSeen);
      Expect.isTrue(error is ArgumentError);
      Expect.equals(expected, (error as ArgumentError).message);
      firstErrorSeen=true;
      asyncEnd();
    },
    onDone:() {
      Expect.fail("unexpected call to onDone()");
    },
    cancelOnError: true
  );
}

main() {
  check([1,2,3,4]);
  check([null,"2",-3,4.0, []]);
}
