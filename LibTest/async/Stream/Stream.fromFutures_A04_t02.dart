/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream.fromFutures(Iterable<Future<T>> futures)
 *    Create a stream from a group of futures.
 *    The stream reports the results of the futures on the stream in the order
 *  in which the futures complete.
 *    If some futures have completed before calling Stream.fromFutures,
 *  their result will be output on the created stream in some unspecified order.
 *    When all futures have completed, the stream is closed.
 *    If no future is passed, the stream closes as soon as possible.
 * @description Checks Stream interface methods (error processing)
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "allTests_A02.lib.dart";
import "distinct_A05_t01.test.dart" as distinct_A05_t01;

Stream<T> create(Iterable<T> data, {bool isError(T x)}){
  Future future = new Future.value();
  return new Stream.fromFutures(
     data.map(
        (x) {
          return future = future.catchError((_){}).then(
            (_) {
              if (isError!=null && isError(x)){
                throw x;
              }
              return x;
            }
          );
        }
     )
  );
}

main() {
  test(create);
}
