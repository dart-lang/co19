/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws ArgumentError in unchecked mode if elements contained in the list aren't Strings,
 * TypeError in checked mode.
 * @description Checks that appropriate exception is thrown.
 * @author msyabro
 * @needsreview undocumented
 */
import "../../../Utils/dynamic_check.dart";

check(List l) {
  if(isCheckedMode()) {
    try {
      Strings.concatAll(l);
      Expect.fail("TypeError expected");
    } on TypeError catch(e) {}
  } else {
    try {
      Strings.concatAll(l);
      Expect.fail("ArgumentError expected");
    } on ArgumentError catch(e) {}
    
  }
}

main() {
  check(["1",2]);
  check([1, "2", 3]);
  check(["1", 2.0, (3/0)]);
  check([true, false]);
  check([new Object()]);
}
