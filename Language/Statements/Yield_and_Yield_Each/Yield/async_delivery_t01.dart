// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An async* function returns a stream. Listening on that stream
/// executes the function body linked to the stream subscription returned by
/// that listen call.
///
/// A yield e; statement is specified such that it must successfully deliver the
/// event to the subscription before continuing. If the subscription is
/// canceled, delivering succeeds and does nothing, if the subscription is a
/// paused, delivery succeeds when the event is accepted and buffered.
/// Otherwise, deliver is successful after the subscription's event listener has
/// been invoked with the event object.
///
/// After this has happened, the subscription is checked for being canceled or
/// paused. If paused, the function is blocked at the yield statement until the
/// subscription is resumed or canceled. In this case the yield is an
/// asynchronous operation (it does not complete synchronously, but waits for an
/// external event, the resume, before it continues). If canceled, including if
/// the cancel happens during a pause, the yield statement acts like a return;
/// statement.
///
/// @description Check that if the subscription is canceled, delivering succeeds
/// and does nothing
///
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<int> generator() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
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
