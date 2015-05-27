/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Stream<T> asStream()
 * The stream closes after the completion value.
 * @description Checks that the stream closes after the completion value is send.
 * @author kaigorodov
 */
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

import "dart:async";

String output1;

main() {
  var value=99;
  Future future = new Future.sync(()=>value);
  Stream stream=future.asStream();
  int count=1;
  
  asyncStart();
  stream.listen(
    (var event){  // should be invoked first
    	count=count+1;
    },
    onDone: (){
	  Expect.equals(2, count);
      asyncEnd();
    }   // should be invoked second
  );

}
