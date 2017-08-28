/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> stream
 * The stream that this controller is controlling.
 * @description Checks that property stream implements Stream interface
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../Stream/allTests_A02.lib.dart";

Stream<T> create<T>(Iterable<T> data, {bool isError(T element)}) {
  StreamController<T> sc;
  sc = new StreamController<T>(
    sync:true,
    onListen:() {
      new Future(() {
        for (T e in data) {
          if (sc.isClosed){
            break;
          }
          if (isError != null && isError(e)) {
            sc.addError(e);
          } else {
            sc.add(e);
          }
        }
      }).then((_) => sc.close());
    },
    onCancel: () {
      sc.close();
    }
  );
  return sc.stream;
}

main() {
  test(create);
}
