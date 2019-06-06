/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks string concatenation
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../Utils/expect.dart';

typedef StringAlias = String;

main() {
  String s = "Lily";
  StringAlias s1 = "was";
  StringAlias s2 = "here";

  Expect.equals("Lily was here", s + " " + s1 + " " + s2);
  Expect.equals("Lily was here", "Lily $s1 $s2");
  Expect.equals("washere", s1 + s2);
}
