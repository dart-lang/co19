/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asBroadcastStream (
 *   {void onListen(StreamSubscription<T> subscription),
 *    void onCancel(StreamSubscription<T> subscription)})
 * Returns a multi-subscription stream that produces the same events as this.
 *
 * The returned stream will subscribe to this stream when its first subscriber
 * is added, and will stay subscribed until this stream ends, or a callback
 * cancels the subscription.
 *
 * @description Checks that returned stream will subscribe to this stream
 * when its first subscriber is added.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  bool hasListener = false;
  StreamController controller = new StreamController(
      onListen:(){ hasListener = true;}
  );
  Stream b = controller.stream.asBroadcastStream();
  Expect.isFalse(hasListener);
  asyncMultiStart(2);
  b.listen(
    (_) {
      Expect.isTrue(hasListener);
      asyncEnd();
    }
  );
  b.listen(
    (_) {
      Expect.isTrue(hasListener);
      asyncEnd();
    }
  );
  Expect.isTrue(hasListener);
  controller.add("a");
  new Future(() => controller.close());
}
