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
 */

#import("../../../../Utils/dynamic_check.dart");

main() {
  if(isCheckedMode()) {
    return;
  }
  try {
    [1, -1].forEach(null);
    Expect.fail("ObjectNotClosureException expected.");
  } catch(ObjectNotClosureException e) {}
  try {
    var f = 123;
    [1, -1].forEach(f);
    Expect.fail("ObjectNotClosureException expected.");
  } catch(ObjectNotClosureException e) {}
}
