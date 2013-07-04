/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory StreamController({void onListen(), void onPause(),
 *                  void onResume(), void onCancel(), bool sync: false})
 * If sync is true, events may be passed directly to the stream's listener during
 * an add, addError or close call.
 * If sync is false, the event will be passed to the listener at a later time,
 * after the code creating the event has returned.
 * @description Checks that if sync is false, the event will be passed to the listener at a later time,
 * after the code creating the event has returned.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  StreamController controller=new StreamController(sync: false);
  Stream s=controller.stream;
  bool onDataCalled=false;
  asyncStart();
  s.listen((var event){
      onDataCalled=true;
      asyncEnd();
    }
  ); 
  controller.add(1);
  Expect.isFalse(onDataCalled);
}
