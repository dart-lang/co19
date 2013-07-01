/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(Object asyncError)})
 * If onError is not given, it is equivalent to (e) { throw e; }.
 * That is, it forwards the error to f.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main1() {
  Completer completer = new Completer();
  Future f = completer.future;
  
  Future f1=f.then((fValue) {
    return 0;
  });

  completer.completeError(2);
  
  int res=null;
  Object err=null;
  asyncStart();
  Future f2=f.then(
     (fValue) {
       asyncEnd();
       res = fValue;
     }, 
     onError: (e){
       asyncEnd();
       err=e;
     }
  );
     
  runAfter(f2, (){
    Expect.equals(null, res);
    Expect.equals(2, err);
  });
}


main() {
  Completer completer = new Completer();
  Future f = completer.future;
  
  Future f1=f.then((fValue) {
    return 0;
  });

  completer.completeError(2);
  
  int res=null;
  Object err=null;
  asyncStart();
  Future f2=f1.then(
    (int fValue) {res = fValue;}, 
    onError: (Object e){
      asyncEnd();
      err = e;
    }
  );
     
  asyncStart();
  f2.whenComplete((){
    Expect.equals(null, res);
    Expect.equals(2, err);
    asyncEnd();
  });
}
