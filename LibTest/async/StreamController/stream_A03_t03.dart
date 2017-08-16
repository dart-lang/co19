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
import "../Stream/allTests_A03.lib.dart";

Stream<T> create(Iterable<T> data, {boolean isError(T element)}) {
  StreamController sc;
  sc = new StreamController(
    sync:true,
    onListen:() {
      new Future(() {
        for (var e in data) {
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
