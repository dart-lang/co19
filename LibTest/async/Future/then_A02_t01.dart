/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(Object asyncError)})
 * If the invoked callback throws an exception, the returned future f is completed with the error.
 * @description Checks that if the invoked callback throws an exception,
 * the returned future f is completed with the error.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  Completer completer = new Completer();
  Future f0 = completer.future;
  Error err=new Error();
  
  completer.complete(1);
  
  asyncStart();
  Future f=f0.then((fValue) {
    asyncEnd();
    throw err;
  });

  int res1=null;
  Object res2=null;
  asyncStart();
  Future f1=f.then(
     (fValue) {
       asyncEnd();
       res1 = fValue;
     }, 
     onError: (e){
       asyncEnd();
       res2=e;
     }
  );
     
  runAfter(f1, (){
    Expect.equals(null, res1);
    Expect.equals(err, res2);
  });
}
