/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream transform(StreamTransformer<T, dynamic> streamTransformer)
 * Chains this stream as the input of the provided StreamTransformer.
 * Returns the result of streamTransformer.bind itself.
 * @description Checks that the data and error events are produced according
 * to transform.
 * @author a.semenov@unipro.ru
 */
library transform_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

StreamTransformer<int, int> passThrough = new StreamTransformer.fromHandlers();
StreamTransformer<int, int> doubleDataNegateError =
    new StreamTransformer.fromHandlers(
      handleData: (int event, EventSink<int> sink){
        sink.add(event);
        sink.add(event);
      },
      handleError: (Object error, StackTrace st, EventSink<int> sink) {
        sink.addError(-(error as int));
      }
    );

void check<T,S>(Stream<T> s, StreamTransformer<T,S> transformer,
           List<S> expectedData, List expectedErrors) {
  AsyncExpect.events(expectedData, expectedErrors, s.transform(transformer));
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([1,2,3,4,5]), passThrough, [1,2,3,4,5], []);
  check(create([1,2,3,4,5], isError: (x) => x.isOdd), passThrough, [2,4], [1,3,5]);
  check(create([1,2,3,4,5], isError: (x) => true), passThrough, [], [1,2,3,4,5]);

  check(create([1,2,3,4,5]), doubleDataNegateError, [1,1,2,2,3,3,4,4,5,5], []);
  check(
      create([1,2,3,4,5], isError: (x) => x.isOdd),
      doubleDataNegateError,
      [2,2,4,4],
      [-1,-3,-5]
  );
  check(
      create([1,2,3,4,5], isError: (x) => true),
      doubleDataNegateError,
      [],
      [-1,-2,-3,-4,-5]
  );
}
