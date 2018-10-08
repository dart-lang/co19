/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> handleError(Function onError, {bool test(error)})
 * If the error is intercepted, the handle function can decide what to do with
 * it. It can throw if it wants to raise a new (or the same) error, or simply
 * return to make the stream forget the error.
 * @description Checks that if an error is rethrown, it appears in the returned
 * stream.
 * @author a.semenov@unipro.ru
 */
library handleError_A03_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s, void onError(error), List data, List intercepted, List expected) {
  List actualIntercepted = [];
  List actualErrors = [];
  List actualData = [];
  asyncStart();
  s.handleError(
    (error) {
      actualIntercepted.add(error);
      onError(error);
    }
  ).listen(
      (data) {
        actualData.add(data);
      },
      onError: (error){
        actualErrors.add(error);
      },
      onDone:() {
        Expect.listEquals(data, actualData);
        Expect.listEquals(intercepted, actualIntercepted);
        Expect.listEquals(expected, actualErrors);
        asyncEnd();
      }
   );
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([]), (e) => throw e, [], [], []);
  check(create([], isError:(x) => true), (e) => throw e, [], [], []);

  check(create([1, 2, 3, 4, 5], isError: (x) => true),
      (x) => throw x, [], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]);

  check(
      create(
          ["a", 1, "b", 2, "c", 3, "d", 4, "e", 5, "f"],
          isError: (x) => x is num
      ),
      (x) { if (x.isEven) { throw x; }}, // onError function
      ["a", "b", "c", "d", "e", "f"], // expected data
      [1, 2, 3, 4, 5],  // intercepted errors
      [2,4] // rethrown errors
  );

  check(
      create(
          ["a", 1, "b", 2, "c", 3, "d", 4, "e", 5, "f"],
          isError: (x) => x is num
      ),
      (x) { if (x.isEven) { throw x + 10; }}, // onError function
      ["a", "b", "c", "d", "e", "f"], // expected data
      [1, 2, 3, 4, 5],  // intercepted errors
      [12,14] // rethrown errors
  );
}
