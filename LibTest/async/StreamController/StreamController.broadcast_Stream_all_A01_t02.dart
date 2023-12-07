// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion StreamController.broadcast({void onListen(), void onCancel(),
///                                       bool sync: false})
/// A controller where stream can be listened to more than once.
///
/// The Stream returned by stream is a broadcast stream. It can be listened to
/// more than once.
///
/// The controller distributes any events to all currently subscribed listeners
/// at the time when add, addError or close is called.
///
/// @description Checks that property stream implements Stream interface
/// @author a.semenov@unipro.ru

import "dart:async";
import "../Stream/allTests_A02.lib.dart";

Stream<T> create<T>(Iterable<T> data,
    {bool isError(T element)?, T? defaultValue}) {
  StreamController<T>? sc;
  sc = new StreamController<T>.broadcast(onListen: () {
    for (T e in data) {
      if (isError != null && isError(e)) {
        sc?.addError(e as Object);
      } else {
        sc?.add(e);
      }
    }
    new Future(() => sc?.close());
  }, onCancel: () {
    sc?.close();
  });
  return sc.stream;
}

main() {
  test(create);
}
