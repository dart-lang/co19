/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [ObjectNotClosureException] if argument is not a function.
 * @description Checks that ObjectNotClosureException exception is thrown as expected, 
 * if the list is not empty.
 * @author pagolubev
 * @reviewer varlax
 * @needsreview issue 3223
 */

#import("../../../Utils/dynamic_check.dart");

check(list, arg) {
  try {
    list.forEach(arg);
    Expect.fail("ObjectNotClosureException expected.");
  } catch(ObjectNotClosureException e) {}
}

main() {
  if(isCheckedMode()) {
    return;
  }
  check([1], 1);
  check([1], null);
  check([1], "");
  check([1], 3.14);

  check(const [1], 1);
  check(const [1], null);
  check(const [1], "");
  check(const [1], 3.14);

  check(new List.from([1]), 1);
  check(new List.from([1]), null);
  check(new List.from([1]), "");
  check(new List.from([1]), 3.14);

}
