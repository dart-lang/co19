/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract StreamSubscription<T> listen(void onData(T event),
 *   {Function onError, void onDone(), bool cancelOnError})
 * Adds a subscription to this stream.
 * If onData is null, nothing happens.
 * @description Checks that onData can be null;
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";

void check(List data) {
  Stream s1=new Stream.fromIterable(data);
  asyncStart();
  StreamSubscription ss=s1.listen(null,
    onDone:(){
      asyncEnd();
    }
  ); 
}

main() {
  check([]);
  check([1,2,3,4]);
  check([null,"2",-3,4.0, []]);
}
