/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream map(convert(T event))
 * Creates a new stream that converts each element of this stream to a new value
 * using the convert function.
 * @description Checks that each element of this stream is processed.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(List data) {
  Stream s1=IsolateStream.fromIterable(data);
  List sink=new List();
  asyncStart();
  Stream s2=s1.map((var event)=>event);
  s2.listen((var event){
      sink.add(event);
    },
    onDone:(){
      Expect.listEquals(data, sink);
      asyncEnd();
    }
  ); 
}

main() {
  check([]);
  check([1,2,3,4]);
  check([null,"2",-3,4.0, []]);
}
