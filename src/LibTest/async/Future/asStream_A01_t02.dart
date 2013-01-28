/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Stream<T> asStream()
 * Creates a Stream that sends this' completion value, data or error, to its subscribers.
 * @description Checks that the stream sends this' error to all its subscribers.
 * @author kaigorodov
 */

import "dart:async";

main() {
  var value=99;
  Future future = new Future.immediate(value);
  Stream stream=future.asStream();
  Future f2=stream.single;
  bool visited = false;

  StreamSubscription streamsub = stream.listen((var event){},
    onDone: (){visited=true;}
  );
  f2.then((fValue) {
    Expect.equals(fValue, value);
  });

  new Future.delayed(0, (){Expect.isTrue(visited);});
}
