/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future done
 * The done Future completes with the same values as close, except for the
 * following case:
 * The synchronous methods of EventSink were called, resulting in an error.
 * If there is no active future (like from an addStream call), the done future
 * will complete with that error.
 * @description Checks that if synchronous methods resulted in an error,
 * while there was no active future, the done future completes with that error.
 * @author ilya
 * @needsreview what is considered an error?
 */

import "dart:async";
//import "../../../Utils/async_utils.dart";
//import "../../../Utils/expect.dart";

main() {
  var c = new StreamController();

  c.done
    .then((x) {
      print('completed with value $x');
    })
    .catchError((x) {
      print('completed with error $x');
    });

  c.addError(1);
  
  c.stream.listen(null, onError:(_){});
  //c.stream.listen(null);

  c.close()
    .then((x) {
      print('completed with value $x');
    })
    .catchError((x) {
      print('completed with error $x');
    });
}
