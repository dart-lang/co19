/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream transform(StreamTransformer<T, dynamic> streamTransformer)
 * Chains this stream as the input of the provided StreamTransformer.
 * Returns the result of streamTransformer.bind itself.
 * @description Checks that the new stream sends the same error and done events as this stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

StreamTransformer<int, int> createMyTransformer()  {
  return new StreamTransformer (
    handleData: (int event, EventSink<int> sink) {
      sink.add(event);
    }
  );
}

void check(Iterable data, bool test(event)) {
  Stream s = new Stream.fromIterable(data)
    .map( (x) => x%2==0?x:throw new ArgumentError(x) );
  Stream s2=s.transform(createMyTransformer()).asBroadcastStream();
  
  List err1=new List();
  List err2=new List();

  Sync2 sync=new Sync2((err1, err2) {
    Expect.listEquals(err1, err2);
  });

  asyncStart();
  s2.listen((int value){},
    onError: (error) {
      sync.put1(error);
    },
    onDone:() {
      asyncEnd();
    }
  );
  asyncStart();
  s2.where(test).listen((int value){},
    onError: (error) {
      sync.put1(error);
    },
    onDone:() {
      asyncEnd();
    }
  );
}

main() {
  check(new Iterable.generate(10, (int index)=>index),
    (event)=>true
  );
}

