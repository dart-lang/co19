// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isBroadcast
/// Reports whether this stream is a broadcast stream.
/// @description Checks that default implementation returns false.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";

class MyStreamSubscription<T> implements StreamSubscription<T> {
  @override
  Future<E> asFuture<E>([E? futureValue]) {
    throw UnimplementedError();
  }

  @override
  Future<void> cancel() {
    throw UnimplementedError();
  }

  @override
  void onData(void Function(T data)? handleData) {}
  @override
  void onDone(void Function()? handleDone) {}
  @override
  void onError(Function? handleError) {}
  @override
  void pause([Future<void>? resumeSignal]) {}
  @override
  void resume() {}
  @override
  bool get isPaused => throw UnimplementedError();
}

class MyStream<T> extends Stream<T> {
  StreamSubscription<T> listen(void onData(T event)?,
      {Function? onError, void onDone()?, bool? cancelOnError}) {
    return new MyStreamSubscription();
  }
}

main() {
  Stream s = new MyStream();

  Expect.isFalse(s.isBroadcast);
}
