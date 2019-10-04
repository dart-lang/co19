/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any expression of the form e1(args) or e1<types>(args) where e1
 * does not denote a method, and where the static type of e1 is not a function
 * type, an interface type declaring a call method, or dynamic, will currently
 * be a compile-time error. If the static type of e1 is an interface type
 * declaring a call getter, then this stays a compile-time error. Otherwise we
 * check for extensions applying to the static type of e1 and declaring a call
 * member. If one such most specific extension exists, and it declares a call
 * extension method, then the expression is equivalent to e1.call(args) or
 * e1.call<typeS>(args). Otherwise it is still a compile-time error.
 *
 * @description Check that extension with the 'call' method is applicable, then
 * it is called
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

extension Tricky on int {
  List<int> call(int to) =>
    List<int>.generate(to - this + 1, (i) => i + this);
}

main() {
  Expect.listEquals([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 1(10));
  Expect.listEquals([2, 3, 4, 5], 2(5));
}
