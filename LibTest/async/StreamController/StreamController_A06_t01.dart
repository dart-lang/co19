/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory StreamController({void onListen(), void onPause(),
 *                  void onResume(), void onCancel(), bool sync: false})
 * The onListen callback is called when the stream receives its listener
 * and onCancel when the listener ends its subscription.
 * @description Checks that the onListen function is called when the stream receives its listener.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  bool onListenCalled=false;
  asyncStart();
  StreamController controller=new StreamController(
    onListen: (){
      onListenCalled=true;
      asyncEnd();
    }
  );

  Expect.isFalse(onListenCalled);
  StreamSubscription subs=controller.stream.listen((event){});
  Expect.isTrue(onListenCalled);
}
