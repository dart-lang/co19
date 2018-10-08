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
 * The result of invoking the transformer closure is a StreamSubscription.
 * The bound stream-transformer (created by the bind method above) then
 * sets the handlers it received as part of the listen call.
 *
 * @description Checks that handlers of StreamSubscription instance returned
 * by transformer are reset to handlers of bound stream subscription.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController c = new StreamController();
  c.addError(1);
  c.add(2);

  StreamTransformer tr = new StreamTransformer(
    (Stream stream, bool cancelOnError) {
      return stream.listen(
        (x) {
          Expect.fail('unexpected call to OnData');
        },
        onError:(x) {
          Expect.fail('unexpected call to OnError');
        },
        onDone:() {
          Expect.fail('unexpected call to OnDone');
        }
      );
    }
  );

  asyncMultiStart(3);

  c.stream.transform(tr).listen(
    (x) {
      asyncEnd();
    },
    onError:(x) {
      asyncEnd();
    },
    onDone:() {
      asyncEnd();
    }
  );

  c.close();
}
