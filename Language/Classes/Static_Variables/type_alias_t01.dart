/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static variables are variables whose declarations are
 * immediately contained  within a class declaration and that are declared
 * static. The static variables of a class C are those static variables
 * declared by C.
 * @description Checks that static variables accessible via type alias
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../Utils/expect.dart";

class C {
  static var foo = "foo val";
}
typedef CAlias = C;


main() {
  Expect.equals("foo val", CAlias.foo);
}
