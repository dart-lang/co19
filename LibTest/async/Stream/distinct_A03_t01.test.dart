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
import "../../../Utils/expect.dart";

class Key<T> {
  T previous;
  T next;

  Key(this.previous, this.next);

  bool operator ==(other) => (other is Key)
      && other.previous == this.previous
      && other.next == this.next;

  int get hashCode {
    return previous.hashCode ^ next.hashCode;
  }

  String toString() {
    return "[$previous,$next]";
  }
}

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

void check<T>(Stream<T> s) {
  Map<Key<T>, int> equalsLog = new Map<Key<T>, int>();

  bool equals(T p, T n) {
  //  print("equals($p,$n)");
    Key<T> key = new Key<T>(p,n);
    equalsLog[key] = 1 + equalsLog.putIfAbsent(key, () => 0);
    return p==n;
  }

  asyncStart();
  Stream<T> d = s.asBroadcastStream().distinct(equals);
  Future.wait([
    subscribe(d),
    subscribe(d),
    subscribe(d)
  ]).then(
    (List<List<T>> result) {
  //    print(equalsLog);
  //    result.forEach(print);
      result.forEach((received) => Expect.listEquals(result[0], received));
      equalsLog.values.forEach((v) => Expect.equals(3, v));
      asyncEnd();
    }
  );

}

void test(CreateStreamFunction create) {
  check(create([]));
  check(create([1, 2, 4, 3]));
  check(create([1, 2, 2, 3]));
  check(create(["a", "b", null, null]));
//  check(create(new Iterable.generate(5, (int index) => 1)));
//  check(create(new Iterable.generate(10, (int index) => [0])));
}
