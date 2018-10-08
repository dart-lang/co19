/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamSubscription<T> listen(void onData(T event),
 *   {Function onError, void onDone(), bool cancelOnError})
 * If cancelOnError is true, the subscription is ended when the first error is
 * reported. The default is false.
 * @description Checks that if cancelOnError is true, the subscription is ended
 * when the first error is reported.
 * @issue #25967
 * @author kaigorodov
 * @author a.semenov@unipro.ru
 */
library listen_A04_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List<T> data, List errors) {
  List<T> dataSink = [];
  List errorSink = [];
  asyncStart();
  s.listen(
      (T event) {
        dataSink.add(event);
      },
      onError: (Object error) {
        errorSink.add(error);
        // wait for possible additional error
        new Future.delayed(durationMs(500), (){
          Expect.listEquals(data, dataSink);
          Expect.listEquals(errors, errorSink);
          asyncEnd();
        });
      },
      onDone: () {
        // onDone is only called if there were no errors
        Expect.listEquals(data, dataSink);
        Expect.listEquals(errors, errorSink);
        asyncEnd();
      },
      cancelOnError: true
  );
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([]), [], []);
  check(create([1, 2, 3, 4], isError:(x) => false), [1, 2, 3, 4], []);
  check(create([1, 2, 3, 4], isError:(x) => true), [], [1]);
  check(create([1, 2, 3, 4], isError:(x) => x.isOdd), [], [1]);
  check(create([1, 2, 3, 4], isError:(x) => x.isEven), [1], [2]);
  check(
      create([null, "2", -3, 4.0, []], isError:(x) => x is num),
      [null, "2"],
      [-3]
  );
}
