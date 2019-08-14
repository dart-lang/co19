/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream transform(StreamTransformer<T, dynamic> streamTransformer)
 * Chains this stream as the input of the provided StreamTransformer.
 * Returns the result of streamTransformer.bind itself.
 * @description Checks that the new stream sends the same error and done events
 * as this stream.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

StreamTransformer createMyTransformer()  {
  return new StreamTransformer.fromHandlers (
    handleData: (event, EventSink sink) {
      sink.add(event);
    }
  );
}

void check(Iterable data) {
  Stream s = IsolateStream.fromIterable(data)
    .map( (x) => x % 2 == 0 ? x : throw new ArgumentError(x)).asBroadcastStream();
  Stream s2 = s.transform(createMyTransformer());
  
  Sync2 sync = new Sync2((err1, err2) {
    Expect.listEquals(err1, err2);
  });

  asyncStart();
  s.listen((var value){},
    onError: (error) {
      sync.put1(error);
    },
    onDone:() {
      asyncEnd();
    }
  );
  asyncStart();
  s2.listen((var value){},
    onError: (error) {
      sync.put1(error);
    },
    onDone:() {
      asyncEnd();
    }
  );
}

main() {
  check(new Iterable.generate(10, (int index) => index));
}
