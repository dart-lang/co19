/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> distinct([bool equals(T previous, T next)])
 *    If a broadcast stream is listened to more than once, each subscription
 * will individually perform the equals test.
 * @description Checks that [equals] is called for each subscription.
 * @issue #29638
 * @author a.semenov@unipro.ru
 */
library distinct_A03_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class Key {
  Object previous;
  Object next;

  Key(this.previous, this.next);

  bool operator ==(other) {
    return (other is Key)
      && (other as Key).previous==this.previous
      && (other as Key).next==this.next;
  }

  int get hashCode {
    return previous.hashCode ^ next.hashCode;
  }

  String toString() {
    return "[$previous,$next]";
  }
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

void check(Stream<T> s) {
  Map<Key, int> equalsLog = new Map<Key, int>();

  bool equals(Object p, Object n) {
  //  print("equals($p,$n)");
    Key key = new Key(p,n);
    equalsLog[key] = 1 + equalsLog.putIfAbsent(key, () => 0);
    return p==n;
  }

  Stream d = s.asBroadcastStream().distinct(equals);
  Future.wait([
    subscribe(d),
    subscribe(d),
    subscribe(d)
  ]).then(
    (List<List> result) {
      print(equalsLog);
      result.forEach(print);
      result.forEach((received) => Expect.listEquals(result[0], received));
      equalsLog.values.forEach((v) => Expect.equals(3, v));
      asyncEnd();
    }
  );

}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]));
  check(create([1, 2, 4, 3]));
  check(create([1, 2, 2, 3]));
  check(create(["a", "b", null, null]));
//  check(create(new Iterable.generate(5, (int index) => 1)));
//  check(create(new Iterable.generate(10, (int index) => [0])));
}
