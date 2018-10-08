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
 * @description Checks expected data events on transformed stream.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

// transform: skip evens, produce number and its double, convert errors to data
myTransformer() {
  return new StreamTransformer(
    (Stream s, _) {
      StreamController c = new StreamController();
      s.listen(
        (x) {
          if (x.isOdd) {
            c.add(x);
            c.add(x*2);
          }
        },
        onError:(x) {
          c.add(x);
        },
        onDone:() {
          c.close();
        }
      );
      return c.stream.listen(null);
    }
  );
}

main() {
  StreamController c = new StreamController();
  c.add(1);
  c.add(2);
  c.add(3);
  c.add(4);
  c.add(5);
  c.addError(1);
  c.addError(2);
  c.addError(3);
  c.addError(4);
  c.addError(5);

  asyncStart();
  
  c.stream.transform(myTransformer()).toList().then(
    (x) {
      Expect.listEquals([1,2,3,6,5,10,1,2,3,4,5], x);
      asyncEnd();
    }
  );

  c.close();
}
