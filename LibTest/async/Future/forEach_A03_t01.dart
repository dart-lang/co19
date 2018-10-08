/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(Iterable input, dynamic f(element))
 * Any errors will cause the iteration to stop and will be piped through the
 * returned Future.
 * @description Checks that an error in the action function causes the
 * iteration to stop and is piped through the returned Future.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

List<int> input = [0,1,2,3,4];
int e2stop = 2;

main() {
  List<bool> operationTrace = new List<bool>.filled(input.length, false);

  dynamic f(int element) {
    if (element == e2stop) {
       throw element;
    }
    operationTrace[element] = true;
    return new Future.sync(() => element);
  }

  asyncStart();
  Future.forEach(input, f).catchError((Object error) {
    Expect.equals(e2stop, error);
    Expect.listEquals([true, true, false, false, false], operationTrace);
    asyncEnd();
  });
}
