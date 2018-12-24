/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory StreamTransformer(StreamSubscription<T>
 *   transformer(Stream<S> stream, bool cancelOnError))
 * Creates a StreamTransformer.
 *
 * The transformer closure receives the stream, that was bound, as argument
 * and returns a StreamSubscription. In almost all cases the closure listens
 * itself to the stream that is given as argument.
 *
 * @description Checks that transformer will listen to whatever stream the
 * the returned StreamSubscription is created for.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Stream<int> s = new Stream.fromIterable([1]);
  StreamTransformer<int, dynamic> tr = new StreamTransformer(
    (_, __) {
      Stream s2 = new Stream.fromIterable([2]);
      return s2.listen(null);
    }
  );

  asyncStart();
  s.transform(tr).toList().then(
    (x) {
      Expect.listEquals([2], x);
      asyncEnd();
    }
  );
}
