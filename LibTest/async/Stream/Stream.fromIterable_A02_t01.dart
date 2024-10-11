// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<T>.fromIterable( Iterable<T> elements )
///
/// Creates a stream that gets its data from `elements`.
///
/// The iterable is iterated when the stream receives a listener, and stops
/// iterating if the listener cancels the subscription, or if the
/// [Iterator.moveNext] method returns false or throws. Iteration is suspended
/// while the stream subscription is paused.
///
/// If calling [Iterator.moveNext] on `elements.iterator` throws, the stream
/// emits that error and then it closes. If reading [Iterator.current] on
/// `elements.iterator` throws, the stream emits that error, but keeps iterating
///
/// Can be listened to more than once. Each listener iterates elements
/// independently.
///
/// @description Checks that if iterating throws an error, `onError` callback
/// is run with this error. Also checks that data events are neither further
/// generated nor fired and `onDone` event does not happen.
/// @author ilya

import "dart:async";
import "../../../Utils/expect.dart";

int f(int i) {
  if (i < 5) return i;
  if (i == 5) throw i;
  if (i > 5) Expect.fail('data generation did not stop');
  return 42;
}

main() {
  Iterable<int> it = new Iterable<int>.generate(10, (int i) => f(i));
  Stream<int> s = new Stream<int>.fromIterable(it);
  List events = [];
  asyncStart();

  s.listen((int x) {
    events.add(x);
  }, onError: (error) {
    events.add(error);
    // wait some time for additional (wrong) events
    new Future.delayed(durationInMilliseconds(500), () {
      Expect.listEquals([0, 1, 2, 3, 4, 5, "done"], events);
      asyncEnd();
    });
  }, onDone: () {
    events.add("done");
  });
}
