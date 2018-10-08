/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> singleWhere(bool test(T element))
 * Like lastMatch, except that it is an error if more than one matching element
 * occurs in the stream.
 * @description Checks that it is an error if more than one matching element
 * occurs in the stream.
 * @author kaigorodov
 */
library singleWhere_A02_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.error((e) => e is Error, create([1, 2, 3]).singleWhere((int e) => true));
  AsyncExpect.error((e) => e is Error, create([1, 2, 3]).singleWhere((int e) => e!=null));
  AsyncExpect.error((e) => e is Error, create([-1, 2, 3]).singleWhere((int e) => e > 0));
  AsyncExpect.error(
    (e) => e is Error,
    create(
        new Iterable.generate(10, (int i) => i * 5)
    ).singleWhere((int e) => e != 30)
  );
}
