/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(Iterable input, dynamic f(element))
 * Any errors will cause the iteration to stop and will be piped through the
 * returned Future.
 * @description Checks that an asynchronous error in the action function
 * causes the iteration to stop and is piped through the returned Future.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  List log = [];

  dynamic f(element) {
    log.add(element);
    return element==2 ? new Future.error("@") : new Future.value(null);
  }

  asyncStart();
  Future.forEach([0,1,2,3,4], f).catchError((Object error) {
    Expect.equals("@", error);
    Expect.listEquals([0,1,2], log);
    asyncEnd();
  });
}
