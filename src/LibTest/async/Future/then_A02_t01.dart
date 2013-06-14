/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(AsyncError asyncError)})
 * If the invoked callback throws an exception, the returned future f is completed with
 * the error. If the value thrown is an AsyncError, it is used directly, as the error result.
 * Otherwise it is wrapped in an AsyncError first.
 * @description Checks that if the invoked callback throws not an AsyncError, the returned future f
 * is completed with an AsyncError wrapping that error.
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
  
  Future f=f0.then((fValue) {
    throw err;
  });

  int res1=null;
  AsyncError res2=null;
  f.then((fValue) {res1 = fValue;}, 
     onError: (AsyncError e){res2=e;});
     
  runLater((){
    Expect.equals(null, res1);
    Expect.equals(err, res2);
  });
}
