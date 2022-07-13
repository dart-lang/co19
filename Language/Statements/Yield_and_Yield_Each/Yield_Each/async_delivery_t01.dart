// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A yield* e; statement listens on the stream that e evaluates to
/// and forwards all events to this function's subscription. If the subscription
/// is paused, the pause is forwarded to the yielded stream. If the subscription
/// is canceled, the cancel is forwarded to the yielded stream, then the yield*
/// statement waits for any cancellation future, and finally it acts like a
/// return; statement. If the yielded stream completes, the yield statement
/// completes normally. A yield* is always an asynchronous operation.
///
/// @description Check that if the subscription is canceled, the cancel is
/// forwarded to the yielded stream, then the yield* statement waits for any
/// cancellation future, and finally it acts like a return; statement.
///
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<int> generator([bool generate = false]) async* {
  if (generate) {
    yield* generator(true);
  } else {
    for (int i = 1; i <= 3; i++) {
      yield i;
    }
  }
}

test() async {
  List log = [];
  Stream<int> s = generator();
  late StreamSubscription<int> ss;
  ss = s.listen((int i) {
    log.add(i);
    ss.cancel();
  });
  await Future.delayed(Duration(seconds: 1));
  Expect.listEquals([1], log);
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
