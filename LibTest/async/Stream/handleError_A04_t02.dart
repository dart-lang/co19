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
 * @description Checks that stack trace from Future.error constructor is
 * propagated correctly to onError callback.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Error error = new Error();
  StackTrace stackTrace;
  var s;
  try {
    throw error;
  } catch (e,st) {
    stackTrace = st;
    s = new Stream.fromFuture(new Future.error(e, st));
  }

  Stream s2 = s.handleError((e, st) {
    Expect.identical(error, e);
    Expect.identical(stackTrace, st);
    asyncEnd();
  });

  asyncStart();

  s2.listen((_) {});
}
