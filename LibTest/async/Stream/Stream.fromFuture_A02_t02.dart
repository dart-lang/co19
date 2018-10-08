/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.fromFuture(Future<T> future)
 * When the future completes, the stream will fire one event, either data or
 * error, and then close with a done-event.
 * @description Checks that if the future completes with error, the stream will
 * fire one error event, and then close with a done-event.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Error error = new Error();
  // using immediate sync future
  void throwError() {throw error;}
  AsyncExpect.events([], [error], new Stream.fromFuture(new Future.sync(throwError)));

  // using immediate future
  AsyncExpect.events([], [error], new Stream.fromFuture(new Future(throwError)));

  // using completable future
  Completer completer = new Completer();
  AsyncExpect.events([], [123], new Stream.fromFuture(completer.future));
  completer.completeError(123);

  AsyncExpect.events([], [3.14], new Stream.fromFuture(new Future.error(3.14)));
}
