/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(AsyncError asyncError)})
 * If onError is not given, it is equivalent to (e) { throw e; }.
 * That is, it forwards the error to f.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

import "dart:async";

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  
  Future f1=f.then((fValue) {
    return 0;
  });

  completer.completeError(2);
  
  int res=null;
  AsyncError err=null;
  f1.then(     (int fValue) {res = fValue;}, 
     onError: (AsyncError e){err = e;});
     
  new Future.delayed(0, (){
    Expect.equals(null, res);
    Expect.equals(2, err.error);
  });
}
