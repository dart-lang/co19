/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream.fromFutures(Iterable<Future<T>> futures)
 * @assertion Stream.periodic(Duration period,
 *     [T computation(int computationCount)])
 * Creates a stream that repeatedly emits events at period intervals.
 * If computation is omitted the event values will all be null.
 * @description Checks Stream interface methods (error processing)
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "allTests_A02.lib.dart";

Stream<T> create<T>(Iterable<T> data, {bool isError(T x)}){
  int count = data.length;
  Iterator<T> iterator = data.iterator;
  return new Stream<T>.periodic(
      new Duration(milliseconds: 10),
      (_) {
        count--;
        if (iterator.moveNext()) {
          Object x = iterator.current;
          if (isError != null && isError(x)) {
            throw x;
          }
          return x;
        }
        return null;
      }
  ).takeWhile((_) => count >= 0);
}

main() {
  test(create);
}
