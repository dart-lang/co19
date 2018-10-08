/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of e and let f be the immediately
 * enclosing function. It is a static type warning if T may not be assigned
 * to the declared return type of f. If f is synchronous it is a static type
 * warning if T may not be assigned to Iterable. If f is asynchronous it is
 * a static type warning if T may not be assigned to Stream.
 *
 * @description Check that compile error is issued, if the body of f is marked
 * async* and the type T may not be assigned to the declared return
 * type of f.
 *
 * @compile-error
 * @issue #25634
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../../Utils/expect.dart';

Stream<String> generator() async* {
  yield* 1;
}

main() {
  asyncStart();
  // we have to use runZoned() because specification does not state
  // how the error should be handled by generator function.
  // see issue #25634
  runZoned(
      () => generator().first,
      onError: (e) {
        Expect.isTrue(e is Error);
        asyncEnd();
      }
  );
}
