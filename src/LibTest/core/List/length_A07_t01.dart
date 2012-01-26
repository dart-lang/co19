/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Method fails gracefully if supplied with argument of invalid type.
 * @description Checks that IllegalArgumentException is thrown.
 * @author varlax
 * @needsreview undocumented
 */

#import("../../../Utils/dynamic_check.dart");

main() {
  if(isCheckedMode()) {
    return;
  }
  List a = new List();

  try {
    a.length = "12";
    Expect.fail("Exception expected when setting list length to string");
  } catch(var ok){}

  List<int> b = new List.from(<int>[1,3,5]);
  try {
    b.length = 12.43;
    Expect.fail("Exception expected when setting list length to double");
  } catch(var ok){}

  try {
    b.length = a;
    Expect.fail("Exception expected when setting list length to array");
  } catch(var ok){}
}
