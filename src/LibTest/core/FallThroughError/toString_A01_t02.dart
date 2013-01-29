/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented.
 * @description Checks that this method causes no error and the result is not
 *              null and is indeed a String. FallThroughError raised using the
 *              proper method (incorrect switch statement).
 * @static-warning
 * @author rodionov
 * @reviewer msyabro
 * @needsreview Undocumented
 */
 
main() {
  try {
    switch(2) {
      case 1:
        print("great!");
        break;
      case 2:
        print("not so great!"); /// static warning fall through
      default:
        print("just awesome!");
        break;
    }
    
    Expect.fail("FallThroughError expected");
  } on FallThroughError catch(e) {
    Expect.isTrue(e.toString() != null);
    Expect.isTrue(e.toString() is String);
  }
}
