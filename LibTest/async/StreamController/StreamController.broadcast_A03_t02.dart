// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion StreamController.broadcast({void onListen(), void onCancel(),
///                                       bool sync = false})
/// The controller does not have any internal queue of events, and if there
/// are no listeners at the time the event or error is added, it will just be
/// dropped.
///
/// @description Checks that an error is not reported as uncaught if there are
/// no listeners. The error is just dropped.
/// @issue 29403
/// @author a.semenov@unipro.ru

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController controller = new StreamController.broadcast();
  controller.addError("lost error");
  asyncStart();
  List receivedData = [];
  controller.stream.listen((data) => receivedData.add(data), onDone: () {
    Expect.listEquals(["event"], receivedData);
    asyncEnd();
  });
  controller.add("event");
  controller.close();
}
