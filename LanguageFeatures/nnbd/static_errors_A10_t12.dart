/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call the default List constructor with a length
 * argument and a type argument which is potentially non-nullable.
 *
 * @description Check that it is not an error if the default List constructor is
 * called with no length argument but with a type argument which is potentially
 * non-nullable.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";
typedef void Foo();
class A {}

test1<T extends Object>() {
  new List<T>();
}
test2<T extends Object?>() {
  new List<T>();
}


main() {
  new List<Never>();
  new List<Function>();
  new List<Foo>();
  new List<A>();
  new List<FutureOr<Never>>();
  new List<FutureOr<Function>>();
  new List<FutureOr<Foo>>();
  new List<FutureOr<A>>();
  new List<FutureOr<FutureOr<A>>>();

  test1<String>();
  test2<String?>();
}
