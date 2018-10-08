/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> map<S>(S convert(T event))
 * Error and done events are passed through unchanged to the returned stream.
 *
 * @description Checks that each error of this stream is passed to returned
 * stream.
 * @author a.semenov@unipro.ru
 */
library map_A03_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  Stream stream = create(["a", "b", "c"], isError:(e) => true);
  AsyncExpect.events([], ["a", "b", "c"], stream.map((e) => e));

  stream = create([1, 2, 3, 4, 5], isError:(e) => e.isEven);
  AsyncExpect.events([1, 3, 5], [2, 4], stream.map((e) => e));
}
