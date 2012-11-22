/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future transform(Function transformation)
 * Exception handlers added to futures after transform() are called 
 * will be executed as though transform() wasn't called.
 * @description  Checks that an exception handler, added to a future
 * after calling [transform], will be invoked as normal.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview TODO draft method doc: update when the apidoc is updated
 */

main() {
  final EX = "Exception!";
  
  Completer completer = new Completer();
  Future f = completer.future;

  Future t = f.transform((value) {
    return '';
  });

  f.then((val) {
    Expect.fail("Then handler shouldn't be called!");
  });
  
  f.handleException((exception) {
    Expect.equals(EX, exception);
    return true;
  });

  completer.completeException(EX);
}
