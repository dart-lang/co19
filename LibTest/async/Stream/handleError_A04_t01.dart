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
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

const N = 10;

main() {
  Stream s = new Stream.fromIterable(new Iterable.generate(N, (x) => x));

  List errors = [];
  List stackTraces = [];
  Stream s2 = s.map((event) {
    try {
      throw new Error();
    } catch(e, st) {
      errors.add(e);
      stackTraces.add(st);
      rethrow; // error and stack trace are the same as e and st
    }
  });

  Stream s3 = s2.handleError((e, st) {
    Expect.identical(errors.removeAt(0), e);
    Expect.identical(stackTraces.removeAt(0), st);
    asyncEnd();
  });

  asyncMultiStart(N);

  s3.listen((_) {
    Expect.fail('unexpected onData event');
  }, onError:(_) {
    Expect.fail('unexpected onError event');
  });
}
