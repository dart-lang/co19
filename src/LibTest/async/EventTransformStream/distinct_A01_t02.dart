/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionStream<T> distinct([bool equals(T previous, T next)])
 * Skips data events if they are equal to the previous data event.
 * The returned stream provides the same events as this stream,
 * except that it never provides two consequtive data events that are equal.
 * Equality is determined by the provided equals method.
 * If that is omitted, the '==' operator on the last provided data element is used.
 * @description Checks that if parameter is present, returned stream filters events
 * according to the supplied function.
 * consecutive identical elements.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

check(Iterable<int> data, bool equals(var previous, var next)) {
  Stream s=new Stream.fromIterable(data);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  Stream d=ets.distinct(equals);
  bool first=true;
  var previous;
  asyncStart();
  d.listen((T event){
      if (first) {
        first=false;
        previous=event;
      } else {
        Expect.isFalse(equals(previous, event), "p=$previous, e=$event");
        previous=event;
      }
    },
    onDone:(){
      asyncEnd();
    }
  );
}

int abs(x)=>x<0?-x:x;

int sign(x)=>(x<0)?-1:(x==0?0:1);

main() {
  check([1,2,2,3],
    (var previous, var next)=>previous==next
  );
  check([2,4,3,1],
    (var previous, var next)=>previous%2==next%2
  );
  check(new Iterable.generate(10, (int index)=>index),
    (var previous, var next)=>abs(previous-next)<=1
  );
  check(new Iterable.generate(10, (int index)=>-5+index),
    (var previous, var next)=>sign(previous)==sign(next)
  );
}
