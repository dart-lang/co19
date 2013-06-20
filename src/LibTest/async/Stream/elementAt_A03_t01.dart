/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 * If this stream provides fewer than index elements before closing, an error is reported.
 * @description Checks that if this stream provides fewer than index elements before closing,
 * an error is reported.
 * @note undocumented fact: error is StateError
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void checkError(Stream s, index) {
  asyncStart();
  s.elementAt(index).then((actual){
      Expect.fail("unexpected onDone call");
    },
    onError: (error) {
      Expect.isTrue(error is StateError);
      asyncEnd();
    }
  );
}

main() {
  checkError(new Stream.fromIterable([]), 1);
  for (int k=1; k<10; k++) {
    Iterable it=new Iterable.generate(k-1,
     (int index)=>index
    );
    checkError(new Stream.fromIterable(it), k);
  }
}

