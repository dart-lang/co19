/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List> wait(Iterable<Future> futures,
 *                {bool eagerError: false, void cleanUp(successValue)})
 * If cleanUp is provided, in the case of an error, any non-null result of a
 * successful future is passed to cleanUp, which can then release any resources
 * that the successful operation allocated.
 * @description Checks if cleanUp is provided, in the case of an error, any
 * non-null result of a successful future is passed to cleanUp (eagerError is
 * false).
 * @author ngl@unipro.ru
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  List<Completer> completers = new List.generate(5, (_)=> new Completer());
  Iterable<Future> futures = completers.map((Completer c) => c.future);
  List successful = [];

  asyncStart();
  Future.wait(futures, eagerError: false, cleanUp: (v) => successful.add(v))
     .then(
        (_) {
          Expect.fail("Returned future should complete with error");
        },
        onError: (Object error) {
          Expect.isTrue(error==1 || error==2, "error: $error, expected 1 or 2");
          Expect.isTrue(completers.fold(true, (r,v) => r && v.isCompleted));
          successful.sort();
          Expect.listEquals([0, 3, 4], successful);
          asyncEnd();
        }
     );

  completers[0].complete(0);
  completers[1].completeError(1);
  completers[2].completeError(2);
  completers[3].complete(3);
  completers[4].complete(4);
}
