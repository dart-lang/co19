/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In checked mode, it is a dynamic type error if a malformed type
 * is used in a type cast as specified in 14.2.
 * @description Checks that it is a dynamic type error if a malformed type
 * is used in a type cast.
 * @author rodionov 
 * @reviewer iefremov
 */

import "../../Utils/dynamic_check.dart";

main() {
  try {
    1 as List<NonExistent>; /// static type warning
  } catch(e) {
    if(isCheckedMode()) {
      Expect.isTrue(e is TypeError);
    } else {
      Expect.isTrue(e is CastError);
    }
  }
}
