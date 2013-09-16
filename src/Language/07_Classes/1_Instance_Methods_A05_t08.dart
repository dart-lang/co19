/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class C declares an instance method
 * named n and an accessible static member named n is declared in a superclass of C.
 * @description Checks that no static warning is produced when a class declares an instance
 * method with the same name as an inaccessible static field in its superclass.
 * @static-clean
 * @author kaigorodov
 * @reviewer rodionov
 * @issue 13242
 */
import "1_Instance_Methods_A05_lib.dart";

class C extends A {
  bool _f(int x, [String xx]) {}
}

main() {
  (new C())._f(1, "");
}
