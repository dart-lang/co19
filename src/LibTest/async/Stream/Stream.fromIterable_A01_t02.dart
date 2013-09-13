/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Stream.fromIterable(Iterable<T> data)
 * Creates a single-subscription stream that gets its data from data.
 * @description Checks that created stream returns all the data from Iterable.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyListener extends StreamListener<int> {
  bool onDoneSeen=false;
  Iterator<int> it;
  int dataLength;
  int count=0;
    
  MyListener(Iterable<int> data):this.it=data.iterator, this.dataLength=data.length;
  
  void onData(int event) {
    Expect.isFalse(onDoneSeen, "onData");
    Expect.isTrue(it.moveNext());
    Expect.equals(it.current, event);
    count++;
  }
  
  void onError(error){
    Expect.fail("onError($error) called unexpectedly");
  }
  
  void onDone(){
    Expect.isFalse(onDoneSeen, "onDone");
    onDoneSeen=true;
    Expect.isFalse(it.moveNext());
    Expect.equals(dataLength, count, "check");
    asyncEnd();
  }
  
  void check(){
    Expect.isTrue(onDoneSeen, "check");
    asyncEnd();
  }
}

check(Iterable<int> data) {
  Stream s=new Stream.fromIterable(data);
  MyListener l=new MyListener(data);
  asyncStart();
  l.listenTo(s);
  asyncStart();
  new Timer(durationMs(10), l.check);
}

main() {
  check([]);
  check([1,2,3,null]);
  check(new Iterable.generate(10, (int index)=>index*2));
}
