/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Method fails gracefully if supplied with argument of invalid type.
 * @description Checks that ArgumentError is thrown.
 * @static-warning
 * @author varlax
 * @reviewer iefremov
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";

import "../../../Utils/dynamic_check.dart";

main() {
  if(isCheckedMode()) {
    return;
  }
  List a = new List();
  Expect.throws(() => a.length = "12"); /// static type warning

  List<int> b = new List.from(<int>[1,3,5]);
  Expect.throws(() => b.length = 12.43); /// static type warning
  Expect.throws(() => b.length = a); /// static type warning
}
