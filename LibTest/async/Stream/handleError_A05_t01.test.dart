/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> handleError(Function onError, {bool test(error)})
 * The onError callback must be of type void onError(error) or
 * void onError(error, StackTrace stackTrace). Depending on the function type
 * the the stream either invokes onError with or without a stack trace. The
 * stack trace argument might be null if the stream itself received an error
 * without stack trace.
 * @description Checks that onError callback with two parameters can be used
 * in which case the second parameter is a stack trace.
 * @author a.semenov@unipro.ru
 */
library handleError_A05_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  List errors = [];
  List traces = [];
  asyncStart();
  Stream s = create([1, 2, 3, 4, 5], isError: (x) => true);
  s.handleError(
    (error, stackTrace) {
      errors.add(error);
      traces.add(stackTrace);
    }
  ).listen(
    (data) {
      // ignore
    },
    onDone:() {
      Expect.listEquals([1, 2, 3, 4, 5], errors);
      Expect.equals(5, traces.length);
      traces.forEach((st) { Expect.isTrue(st==null || st is StackTrace);});
      asyncEnd();
    }
  );
}
