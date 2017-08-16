/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> stream
 * The stream that this controller is controlling.
 * @description Checks Stream interface implementation
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../Stream/allTests_A02.lib.dart";

Stream<T> create(Iterable<T> data, {boolean isError(T element)}) {
  StreamController sc = new StreamController();
  for (var e in data) {
    if (isError != null && isError(e)) {
      sc.addError(e);
    } else {
      sc.add(e);
    }
  }
  new Future(() => sc.close()); // close stream controller later
  return sc.stream;
}

main() {
  test(create);
}
