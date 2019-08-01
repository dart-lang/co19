/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For any member access, x.foo, x.bar(), x.baz = 42, x(42), x[0] = 1
 * or x + y, including null-aware and cascade accesses which effectively desugar
 * to one of those direct accesses, and including implicit member accesses on
 * this, the language first checks whether the static type of x has a member
 * with the same base name as the operation. That is, if it has a corresponding
 * instance member, respectively, a foo method or getter or a foo= setter, a bar
 * member or bar= setter, a baz member or baz= setter, a call method, a
 * []= operator or a + operator. If so, then the operation is unaffected by
 * extensions. This check does not care whether the invocation is otherwise
 * correct, based on number or type of the arguments, it only checks whether
 * there is a member at all.
 *
 * @description Check that dynamic invocation doesn't invoke any extension
 * method
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C {
  String log;
  String method(int i) => "$i";
  noSuchMethod(Invocation i) {
    log = "C NSM invoked. Number of arguments ${i.positionalArguments.length}";
  }
}

extension on C {
  String method(int i, String s) {
    this.log = "Extension on C: $i $s";
  }
}

extension on dynamic {
  String method(int i, String s) {
    this.log = "Extension on dynamic: $i $s";
  }
}

main() {
  dynamic c = new C();
  c.method(42, "-42");
  Expect.equals("C NSM invoked. Number of arguments 2", c.log);
}
