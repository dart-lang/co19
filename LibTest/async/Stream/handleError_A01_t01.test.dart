/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> handleError(Function onError, {bool test(error)})
 * Creates a wrapper Stream that intercepts some errors from this stream.
 * If this stream sends an error that matches test, then it is intercepted by
 * the onError function.
 * An asynchronous error e is matched by a test function if test(e) returns true.
 * @description Checks that an error e intercepted by [onError] function
 * if test(e) returns true.
 * @author a.semenov@unipro.ru
 */
library handleError_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s, bool test(error), List data, List intercepted, List expected) {
  List actualIntercepted = [];
  List actualErrors = [];
  List actualData = [];
  asyncStart();
  s.handleError((error) => actualIntercepted.add(error), test:test).listen(
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
  check(create([]), (x)=>true, [], [], []);
  check(create([], isError:(x)=>true), (x)=>true, [], [], []);
  check(create([1, 2, 3, 4, 5], isError: (x) => true),
      (x)=>x.isEven, [], [2,4], [1,3,5]);

  check(
      create(
          ["a", 1, "b", 2, "c", 3, "d", 4, "e", 5, "f"],
          isError: (x) => x is int
      ),
      (x) => (x is int && x.isEven), // test function
      ["a", "b", "c", "d", "e", "f"], // expected data
      [2,4],  // intercepted errors
      [1,3,5] // passed through errors
  );
}
