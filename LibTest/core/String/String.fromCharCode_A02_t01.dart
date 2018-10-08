/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String.fromCharCode(int charCode)
 * ...
 * If the charCode can be represented by a single UTF-16 code unit, the new
 * string contains a single code unit. Otherwise, the length is 2 and the code
 * units form a surrogate pair. See documentation for fromCharCodes.
 * @description Checks that if the charCode can be represented by a single
 * UTF-16 code unit, the new string contains a single code unit. Otherwise, the
 * length is 2 and the code units form a surrogate pair
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  String str = new String.fromCharCode(0x61);
  Expect.equals(1, str.length);

  str = new String.fromCharCode(0x1D11E);
  Expect.equals(2, str.length);
}
