/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * Completes the Future when the answer is known.
 * @description Checks that the Future is completed when the answer is known.
 * @author kaigorodov
 */

import "dart:async";
import "dart:collection";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyListIterator<E> extends Iterator<E> {
  MyIterable<E> parent;
  List<E> list;
  int pos = -1;

  MyListIterator(this.parent, this.list) {
    parent.answerFound = false;
    parent.extraMoves = false;
  }

  bool moveNext() {
    if (parent.answerFound) {
      parent.extraMoves = true;
    }
    int nextPos = pos + 1;
    bool res = (nextPos < list.length);
    if (res) {
      pos = nextPos;
    } else {
      parent.answerFound = true;
    }
    return res;
  }

  E get current {
    if ((pos == -1) || (pos == list.length)) {
      return null;
    }
    E res = list[pos];
    if (res == parent.match) {
      parent.answerFound = true;
    }
    return list[pos];
  }
}

class MyIterable<E> extends IterableBase<E> {
  List<E> list;
  E match;
  bool answerFound;
  bool extraMoves;

  MyIterable(this.list, this.match);

  Iterator<E> get iterator => new MyListIterator(this, list);

}

check(List l, var match, bool expected) {
  MyIterable myIt = new MyIterable(l, match);
  Stream s = new Stream.fromIterable(myIt);
  Future<bool> fu = s.contains(match);
  asyncStart();
  fu.then((actual) {
    Expect.isTrue(myIt.answerFound, "for $l");
    Expect.isFalse(myIt.extraMoves, "extraMoves for $l");
    asyncEnd();
  });
}

main() {
  check([], null, false);
  check([1, 2 ,[]], null, false);
  check([1, 2 ,null, []], null, true);
  check([1, 2, []], 4, false);
  check([1, 2, null, []], 2, true);
}

