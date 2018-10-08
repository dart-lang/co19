/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new Stream()
 * @description Checks that default constructor works.
 * @author kaigorodov
 */

import "dart:async";

class MyStream<T> extends Stream<T> {
  StreamSubscription<T> listen(void onData(T event),
                   {Function onError, void onDone(), bool cancelOnError})
  {
    return null; 
  }
}

main() {
  new MyStream();
}

