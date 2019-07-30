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
 * it is called. Test type arguments
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C<T extends num> {
  T value;
}

extension IntExtWithCall<T extends num> on C<T> {
  Iterable<T> call(int to) =>
    Iterable<T>.generate(to - this.value + 1, (i) => i + this.value);
}

main() {
  C<int> c = new C<int>();
  c.value = 1;
  Expect.iterableEquals([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], c(10));
  c.value = 2;
  Expect.iterableEquals([2, 3, 4, 5], c(5));
}
