/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream asyncExpand(Stream convert(T event))
 * Creates a new stream with the events of a stream per original event.
 * ...
 * If convert returns null, no value is put on the output stream, just as if it
 * returned an empty stream.
 *
 * @description Checks that if convert returns null, no value is put on the
 * output stream.
 * @author a.semenov@unipro.ru
 */
library asyncExpand_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T,E>(Stream<T> stream, Stream<E> convert(T event), List<E> expected) {
  AsyncExpect.data(expected, stream.asyncExpand(convert));
}

void test(CreateStreamFunction create) {
  check(create([]), (_) => null, []);
  check(create([1,2,3,4,5]), (_) => null, []);

  check(create([]), (e) => create([e]), []);
  check(create([1,2,3,4,5]), (e) => e.isOdd ? create([e]) : null, [1,3,5]);
  check(
      create(['a',null,'b']),
      (e) => e!=null ? create([e]) : null,
      ['a','b']
  );
  check(
      create([1,2,3,4,5]),
      (e) => e.isOdd ? create([e,e]): null,
      [1,1,3,3,5,5]
  );
  check(
      create(['a',null,'b']),
      (e) => e!=null ? create([e,e]) : null,
      ['a','a','b','b']
  );
}
