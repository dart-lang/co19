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

import "dart:async";

String output1;

main() {
  var value=99;
  Future future = new Future.immediate(value);
  Stream stream=future.asStream();
  int count=1;
  
  stream.listen(
    (var event){count=count+1;}, // should be invoked first
    onDone: (){count=count*2;}   // should be invoked second
  );

  new Future.delayed(0, (){Expect.equals(4, count);});
}
