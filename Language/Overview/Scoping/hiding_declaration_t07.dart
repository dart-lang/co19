/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a 
 * scope S, then d hides any declaration named n that is available in the 
 * lexically enclosing scope of S.
 * @description Checks that no static warning is produced if a function 
 * parameter hides a function name.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  int g() {return 1;}
  int f(int g()) {return g();}
  Expect.equals(2, f(() => 2));
}
