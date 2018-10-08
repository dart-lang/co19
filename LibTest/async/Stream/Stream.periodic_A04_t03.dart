/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.periodic(Duration period,
 *     [T computation(int computationCount)])
 * Creates a stream that repeatedly emits events at period intervals.
 * If computation is omitted the event values will all be null.
 * @description Checks Stream interface methods
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "allTests_A03.lib.dart";

Stream<T> create<T>(Iterable<T> data){

  return new Stream.periodic(
      new Duration(milliseconds:10),
      (int i) => data.elementAt(i)
  ).take(data.length);
}

main() {
  test(create);
}
