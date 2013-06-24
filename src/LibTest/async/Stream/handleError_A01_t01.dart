/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> handleError(void handle(error), {bool test(error)})
 * Creates a wrapper Stream that intercepts some errors from this stream.
 * If this stream sends an error that matches test, then it is intercepted by the handle function.
 * An [AsyncError] [:e:] is matched by a test function if test(e) returns true.
 * @description Checks that an error e is matched by a test function if test(e) returns true.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(List data, List expected) {
  Stream s1=new Stream.fromIterable(data);
  
  // make a Stream with error events
  Stream s2=s1.where((var event){
       throw new ArgumentError(event);
    }
  ); 

  // intercept error events, do not (re)throw
  List sink=new List();
  Stream s3=s2.handleError((var error){
       sink.add(error.message);
    },
    test: (error) {
      var element=(error as ArgumentError).message;
      // only even elements matched 
      return (element%2)==0;
    }
  ); 

  asyncStart();
  s3.listen((var event) {
      Expect.fail("unexpected call to onData($event)");
    },
    onError:(Object error) {
      var element=(error as ArgumentError).message;
      // even elements forgot and should not appear 
      Expect.isFalse((element%2)==0);
    },
    onDone:() {
      Expect.listEquals(expected, sink);
      asyncEnd();
    }
  );
}

main() {
  check([], []);
  check([1,2,3,4], [2,4]);
}
