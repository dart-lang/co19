/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(Iterable input, Future f(element))
 * Any errors will cause the iteration to stop and will be piped through the returned Future.
 * @description Checks that an error in the action function causes the iteration to stop and
 * is piped through the returned Future.
 * @author kaigorodov
 */

import "dart:async";

List input=[0,1,2,3,4];
int N=input.length;
int e2stop=2;

main() {
  bool visited = false;
  List<bool> operationTrace=new List<bool>(N);
  
  for (int k=0; k<N; k++) {
    operationTrace[k]=false;
  }
  
  Future ff(int element) {
    print("ff $element");
    if (element==e2stop) {
       throw element;
    }
    operationTrace[element]=true;
    return new Future.immediate(element);
  }
  
  Future f = Future.forEach(input, ff);
  
  f.catchError((AsyncError asyncError) {
    print("catchError $asyncError ${asyncError.error}");
    Expect.equals(e2stop, asyncError.error);
    visited = true;
  });

  new Future.delayed(10, (){
    // make sure future f is completed
    Expect.isTrue(visited);
    Expect.equals([true, true, false, false, false], operationTrace);
  });
}

