/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamController.broadcast({void onListen(), void onCancel(),
 *                                       bool sync: false})
 * If sync is true, events may be fired directly by the stream's subscriptions
 * during an add, addError or close call. The returned stream controller is
 * a SynchronousStreamController, and must be used with the care and attention
 * necessary to not break the Stream contract. See Completer.sync for some
 * explanations on when a synchronous dispatching can be used. If in doubt,
 * keep the controller non-sync.
 *
 * @description Checks that if sync is true, instance of
 * SynchronousStreamController is created
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  StreamController streamController = new StreamController.broadcast(sync: true);
  Expect.isTrue(streamController is SynchronousStreamController);
  streamController.close();
}
