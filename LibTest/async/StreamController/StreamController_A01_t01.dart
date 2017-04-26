/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController({void onListen(), void onPause(),
 *                  void onResume(), dynamic onCancel(), bool sync: false})
 * A controller with a stream that supports only one single subscriber.
 *
 * @description Checks that the controller's stream is not broadcast
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController();
  Stream s = controller.stream;
  Expect.isFalse(s.isBroadcast);
}
