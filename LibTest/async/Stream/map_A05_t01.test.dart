/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> map<S>(S convert(T event))
 * The convert function is called once per data event per listener.
 * If a broadcast stream is listened to more than once, each subscription
 * will individually call convert on each data event.
 *
 * @description Checks that convert function is called once per data event
 * per listener.
 *
 * @author a.semenov@unipro.ru
 */
library map_A05_t01;
import "dart:async";
import "../../../Utils/expect.dart";

Future<List<T>> subscribe<T>(Stream<T> stream) {
  Completer<List<T>> completer = new Completer<List<T>>();
  List<T> received = [];
  stream.listen(
      (T event) {
        received.add(event);
      },
      onDone: () {
        completer.complete(received);
      }
  );
  return completer.future;
}

Future check<T>(Stream<T> stream, List<T> expected) {
  Map<T,int> convertLog = new Map<T,int>();

  T convert(T event) {
//  print("convert $event");
    convertLog[event] = 1 + convertLog.putIfAbsent(event, () => 0);
    return event;
  }

  asyncStart();
  Stream<T> converted = stream.map(convert);
  Future.wait([
    subscribe(converted),
    subscribe(converted),
    subscribe(converted)
  ]).then(
      (List<List<T>> result) {
        result.forEach((received) => Expect.listEquals(expected, received));
        expected.forEach((event) => Expect.equals(3, convertLog[event]));
        asyncEnd();
      }
  );
  return null;
}

void test(CreateStreamFunction create) {
  check(create([]).asBroadcastStream(), []);
  check(create([1, 2, 3, 4, 5]).asBroadcastStream(), [1, 2, 3, 4, 5]);
  check(create(['a', 'b', 'c']).asBroadcastStream(), ['a', 'b', 'c']);
}
