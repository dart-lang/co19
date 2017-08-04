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
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

Map<Object,int> convertLog = new Map<Object,int>();

dynamic convert(Object event) {
//  print("convert $event");
  convertLog[event] = 1 + convertLog.putIfAbsent(event, () => 0);
  return event;
}

Future<List> subscribe(Stream stream) {
  Completer<List> completer = new Completer<List>();
  List received = [];
  stream.listen(
      (event) {
        received.add(event);
      },
      onDone: () {
        completer.complete(received);
      }
  );
  return completer.future;
}

Future check(Stream<T> stream, List expected) {
  asyncStart();
  Stream converted = stream.map(convert);
  Future.wait([
    subscribe(converted),
    subscribe(converted),
    subscribe(converted)
  ]).then(
      (List<List> result) {
        result.forEach((received) => Expect.listEquals(expected, received));
        expected.forEach((event) => Expect.equals(3, convertLog[event]));
        asyncEnd();
      }
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]).asBroadcastStream(), []);
  check(create([1, 2, 3, 4, 5]).asBroadcastStream(), [1, 2, 3, 4, 5]);
  check(create(['a', 'b', 'c']).asBroadcastStream(), ['a', 'b', 'c']);
}
