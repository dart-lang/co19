/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> handleError(Function onError, {bool test(error)})
 * If test is omitted, every error is considered matching.
 * @description Checks that if [test] is omitted, every error is intercepted
 * @author a.semenov@unipro.ru
 */
library handleError_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s, List expectedData, List interceptedErrors) {
  List actualData = [];
  List actualErrors = [];
  List actualHandledErrors = [];
  asyncStart();
  s.handleError((error) => actualHandledErrors.add(error)).listen(
      (data) {
        actualData.add(data);
      },
      onError: (error) {
        actualErrors.add(error);
      },
      onDone: () {
        Expect.listEquals(expectedData, actualData);
        Expect.listEquals(interceptedErrors, actualHandledErrors);
        Expect.listEquals([], actualErrors);
        asyncEnd();
      }
  );
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([]), [], []);
  check(create([], isError:(x) => true), [], []);

  check(create([1, 2, 3, 4]), [1, 2, 3, 4], [] );
  check(create([1, 2, 3, 4], isError:(x)=>true), [], [1, 2, 3, 4]);
  check(create([1, 2, 3, 4], isError: (x)=>x.isEven), [1, 3], [2, 4]);
  check(create([null, "2", -3, 4.0, []], isError: (x) => x is num),
                  [null, "2", []], [-3, 4.0]);
}
