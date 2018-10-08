/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Executes action on each data event of the stream.
 * Completes the returned Future when all events of the stream have been processed.
 * @description Checks that all actions on each data event of the stream are executed.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(List data) {
  Stream s = IsolateStream.fromIterable(data);
  List sink = new List();
  asyncStart();
  Future f = s.forEach((var element){
    sink.add(element);
  });
  f.then((var actual){
    Expect.listEquals(data, sink);
    asyncEnd();
  });
}

main() {
  check([]);
  check([1, 2, 3, 4]);
  check([null, "2", -3, 4.0, []]);
}
