/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> distinct([bool equals(T previous, T next)])
 * Skips data events if they are equal to the previous data event.
 * The returned stream provides the same events as this stream,
 * except that it never provides two consequtive data events that are equal.
 * Equality is determined by the provided equals method.
 * If that is omitted, the '==' operator on the last provided data element is used.
 * @description Checks that if parameter is omitted, returned stream does not contain
 * consecutive identical elements.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer {
}

check(Iterable data) {
  Stream s=new Stream.fromIterable(data);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  Stream d=ets.distinct();
  bool first=true;
  var previous;
  asyncStart();
  d.listen((event){
      if (first) {
        first=false;
        previous=event;
      } else {
        Expect.isFalse(identical(previous, event));
      }
    },
    onDone:(){
      asyncEnd();
    }
  );
}

main() {
  check([]);
  check([1,2,2,3]);
  check([1,2,null,null]);
  check(new Iterable.generate(0, (int index)=>1));
  check(new Iterable.generate(10, (int index)=>[0]));
}
