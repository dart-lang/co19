// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  Stream<E> asyncMap<E>(FutureOr<E> convert(T event))
/// ...
/// This acts like [map], in that [convert] function is called once per
/// data event, but here [convert] may be asynchronous and return a [Future].
/// If that happens, this stream waits for that future to complete before
/// continuing with further events.
///
/// @description Checks that convert function is called once per data event
/// per listener.
/// @issue #29615
/// @author a.semenov@unipro.ru

library asyncExpand_A04_t01;

import "dart:async";
import "../../../Utils/expect.dart";

Future<List<T>> subscribe<T>(Stream<T> stream) {
  Completer<List<T>> completer = new Completer<List<T>>();
  List<T> received = [];
  stream.listen((T event) {
    received.add(event);
  }, onDone: () {
    completer.complete(received);
  });
  return completer.future;
}

Future? check<T>(Stream<T> stream, List<T> expected) {
  Map<Object?, int> convertLog = new Map<Object, int>();

  T convert(T event) {
    convertLog[event] = 1 + convertLog.putIfAbsent(event, () => 0);
    return event;
  }

  Stream<T> converted = stream.asyncMap(convert);
  Future.wait(
          [subscribe(converted), subscribe(converted), subscribe(converted)])
      .then((List<List<T>> result) {
    result.forEach((received) => Expect.listEquals(expected, received));
    expected.forEach((event) => Expect.equals(1, convertLog[event]));
    asyncEnd();
  });
  return null;
}

void test(CreateStreamFunction create) {
  asyncStart(3);
  check(create([]).asBroadcastStream(), []);
  check(create([1, 2, 3, 4, 5]).asBroadcastStream(), [1, 2, 3, 4, 5]);
  check(create(['a', 'b', 'c']).asBroadcastStream(), ['a', 'b', 'c']);
}
