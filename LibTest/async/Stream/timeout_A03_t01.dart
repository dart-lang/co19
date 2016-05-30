/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream timeout(Duration timeLimit,
 *                           {void onTimeout(EventSink sink)})
 * Creates a new stream with the same events as this stream.
 *
 * If onTimeout is omitted, a timeout will just put a TimeoutException into the
 * error channel of the returned stream.
 *
 * @description Check that if onTimeout is omitted, a timeout will just put a
 * TimeoutException into the error channel of the returned stream.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

List<Completer> cl = [new Completer(), new Completer()];
List<int> cv = [1, 2];
int i = 0;

main() {
  Stream s1 = new Stream.fromIterable([cl[0].future, cl[1].future]);
  Stream s2 = s1.asyncMap((var event) => event);
  Stream s3 = s2.timeout(new Duration(microseconds: 1));

  asyncStart();
  s3.listen((var event) {
    Expect.isTrue(i < 2);
    Expect.equals(cv[i++], event);
  }, onError: (error) {
    Expect.isTrue(error is TimeoutException);
    asyncEnd();
  }, onDone: () {
    Expect.isFalse(i < 2);
  });

  cl[0].complete(cv[0]);
}
