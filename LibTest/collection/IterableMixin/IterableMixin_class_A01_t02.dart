/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IterableMixin<E> abstract class
 * This [Iterable] mixin implements all [Iterable] members except [iterator].
 * All other methods are implemented in terms of [iterator].
 * @description Checks that this class implements all methods of [Iterable]
 * except [Iterable.iterator]
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class NaturalIterator implements Iterator<int> {
  int limit;
  int _current = 0;

  NaturalIterator(this.limit);

  bool moveNext() {
    if (_current < limit) {
      _current++;
      return true;
    } else {
      return false;
    }
  }

  int get current => _current;
}

class MyIterable extends Object with IterableMixin {
  int _limit;

  MyIterable(this._limit);

  Iterator<int> get iterator {
    return new NaturalIterator(_limit);
  }
}

void check0(MyIterable myIterable) {
  Expect.throws(() => myIterable.first, (e) => e is StateError);

  Expect.isTrue(myIterable.isEmpty);

  Expect.isFalse(myIterable.isNotEmpty);

  Expect.throws(() => myIterable.last, (e) => e is StateError);

  Expect.equals(0, myIterable.length);

  Expect.throws(() => myIterable.single, (e) => e is StateError);

  Expect.isFalse(myIterable.any((element) => true));

  Expect.isFalse(myIterable.contains(1));

  Expect.throws(() => myIterable.elementAt(0), (e) => e is RangeError);

  Expect.isTrue(myIterable.every((element) => true));

  Iterable expanded = myIterable.expand((var element) => [element]);
  Expect.isTrue(expanded.isEmpty);

  Expect.throws(() {
    myIterable.firstWhere((element) => true);
  }, (e) => e is StateError);

  Expect.equals(0, myIterable.fold(0, (prev, element) => prev + element));

  myIterable.forEach((e) {
    throw new Exception();
  });

  Expect.equals("", myIterable.join(","));

  Expect.throws(() {
    myIterable.lastWhere((element) => true);
  }, (e) => e is StateError);

  Expect.isTrue(myIterable.map((element) => element).isEmpty);

  // not documented
  Expect.throws(() {
    myIterable.reduce((value, element) => value + element);
  }, (e) => e is StateError);
//  Expect.equals(0, myIterable.reduce((value, element) => value + element));

  Expect.throws(() {
    myIterable.singleWhere((element) => true);
  }, (e) => e is StateError);

  Expect.isTrue(myIterable.skip(0).isEmpty);
  Expect.throws(() {
    myIterable.skip(-1);
  });

  Expect.isTrue(myIterable.skipWhile((element) => false).isEmpty);

  Expect.isTrue(myIterable.take(1).isEmpty);
  Expect.throws(() {
    myIterable.take(-1);
  });

  Expect.isTrue(myIterable.takeWhile((element) => true).isEmpty);

  Expect.isTrue(myIterable.toList().isEmpty);
  Expect.isTrue(myIterable.toList(growable: false).isEmpty);

  Expect.isTrue(myIterable.toSet().isEmpty);

  Expect.isTrue(myIterable.where((element) => true).isEmpty);
}

void check1(MyIterable myIterable) {
  Expect.equals(1, myIterable.first);

  Expect.isFalse(myIterable.isEmpty);

  Expect.isTrue(myIterable.isNotEmpty);

  Expect.equals(1, myIterable.last);

  Expect.equals(1, myIterable.length);

  Expect.equals(1, myIterable.single);

  Expect.isTrue(myIterable.any((element) => true));

  Expect.isTrue(myIterable.contains(1));

  Expect.equals(1, myIterable.elementAt(0));

  Expect.isTrue(myIterable.every((element) => true));

  Iterable expanded = myIterable.expand((var element) => [element]);
  Expect.equals(1, expanded.length);

  Expect.equals(1, myIterable.firstWhere((element) => true));

  Expect.equals(1, myIterable.fold(0, (prev, element) => prev + element));

  Expect.throws(() {
    myIterable.forEach((e) {
      throw new Exception();
    });
  });

  Expect.equals("1", myIterable.join(","));

  Expect.equals(1, myIterable.lastWhere((element) => true));

  Expect.isFalse(myIterable.map((element) => element).isEmpty);

  Expect.equals(1, myIterable.reduce((value, element) => value + element));

  Expect.equals(1, myIterable.singleWhere((element) => true));

  Expect.isFalse(myIterable.skip(0).isEmpty);
  Expect.throws(() {
    myIterable.skip(-1);
  });

  Expect.isFalse(myIterable.skipWhile((element) => false).isEmpty);

  Expect.isFalse(myIterable.take(1).isEmpty);
  Expect.throws(() {
    myIterable.take(-1);
  });

  Expect.isFalse(myIterable.takeWhile((element) => true).isEmpty);
  Expect.isTrue(myIterable.takeWhile((element) => false).isEmpty);

  Expect.isFalse(myIterable.toList().isEmpty);
  Expect.isFalse(myIterable.toList(growable: false).isEmpty);

  Expect.isFalse(myIterable.toSet().isEmpty);

  Expect.isFalse(myIterable.where((element) => true).isEmpty);
}

void check2(MyIterable myIterable) {
  Expect.equals(1, myIterable.first);

  Expect.isFalse(myIterable.isEmpty);

  Expect.isTrue(myIterable.isNotEmpty);

  Expect.equals(2, myIterable.last);

  Expect.equals(2, myIterable.length);

  Expect.throws(() => myIterable.single, (e) => e is StateError);

  Expect.isTrue(myIterable.any((element) => true));

  Expect.isTrue(myIterable.contains(2));

  Expect.equals(2, myIterable.elementAt(1));

  Expect.isTrue(myIterable.every((element) => true));

  Iterable expanded = myIterable.expand((var element) => [element]);
  Expect.equals(2, expanded.length);

  Expect.equals(1, myIterable.firstWhere((element) => true));

  Expect.equals(3, myIterable.fold(0, (prev, element) => prev + element));

  Expect.throws(() {
    myIterable.forEach((e) {
      throw new Exception();
    });
  });

  Expect.equals("1,2", myIterable.join(","));

  Expect.equals(2, myIterable.lastWhere((element) => true));

  Expect.isFalse(myIterable.map((element) => element).isEmpty);

  Expect.equals(3, myIterable.reduce((value, element) => value + element));

  Expect.throws(() {
    myIterable.singleWhere((element) => true);
  }, (e) => e is StateError);

  Expect.isFalse(myIterable.skip(0).isEmpty);
  Expect.throws(() {
    myIterable.skip(-1);
  });

  Expect.isFalse(myIterable.skipWhile((element) => false).isEmpty);

  Expect.isFalse(myIterable.take(1).isEmpty);
  Expect.throws(() {
    myIterable.take(-1);
  });

  Expect.isFalse(myIterable.takeWhile((element) => true).isEmpty);
  Expect.isTrue(myIterable.takeWhile((element) => false).isEmpty);

  Expect.isFalse(myIterable.toList().isEmpty);
  Expect.isFalse(myIterable.toList(growable: false).isEmpty);

  Expect.isFalse(myIterable.toSet().isEmpty);

  Expect.isFalse(myIterable.where((element) => true).isEmpty);
}

main() {
  check0(new MyIterable(0));
  check1(new MyIterable(1));
  check2(new MyIterable(2));
}
