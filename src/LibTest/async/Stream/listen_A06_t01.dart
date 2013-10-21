/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract StreamSubscription<T> listen(void onData(T event),
 *   {Function onError, void onDone(), bool cancelOnError})
 * If this stream closes, the onDone handler is called.
 * @description Checks that if this stream closes, the onDone handler is called.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";

main() {
  asyncStart();
  new Stream.fromIterable([]).listen((_){}, onDone:() {asyncEnd();});
  
  asyncStart();
  new Stream.fromIterable([1]).listen((_){}, onDone:() {asyncEnd();});
  
  asyncStart();
  var s = new Stream.fromIterable([1]).asBroadcastStream();
  s.single.then((_){});
  s.listen((_){}, onDone:() {asyncEnd();});
  
  asyncStart();
  s = new Stream.fromFuture(new Future.value(1)).asBroadcastStream();
  s.single.then((_){});
  s.listen((_){}, onDone:() {asyncEnd();});
}
