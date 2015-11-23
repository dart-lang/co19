/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adjacent strings are implicitly concatenated to form a single
 * string literal.
 * @description Checks that adjacent string literals form a single string
 * literal.
 * @author msyabro
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';


main() {
  Expect.equals(2, 'a''b'.length);
  Expect.equals(6, "123""456".length);
  Expect.equals(3, '  ' " ".length);
  Expect.equals(3, '1' '2' '3'.length);
  Expect.equals(4, '''12''' """34""".length);
}
