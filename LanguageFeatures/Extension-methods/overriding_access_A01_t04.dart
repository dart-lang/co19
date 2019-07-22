/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If two or more extensions apply to the same member access, or if a
 * member of the receiver type takes precedence over an extension method, or if
 * the extension is imported with a prefix, then it is possible to force an
 * extension member invocation:
 *
 *   MyList(object).quickSort();
 *
 * or if you don't want the type argument to the extension to be inferred:
 *
 *   MyList<String>(object).quickSort();
 *
 * or if you imported the extension with a prefix to avoid name collision:
 *
 * prefix.MyList<String>(object).quickSort();
 *
 * The syntax looks like a constructor invocation, but it does not create a new
 * object.
 *
 * If [object.quickSort()] would invoke an extension method of [MyList] if
 * [MyList] was the only extension in scope, then [MyList(object).quickSort()]
 * will invoke the exact same method in the same way.
 *
 * @description Check that if several extensions can be applied to the same
 * member access, it's possible to force an extension member invocation if a
 * member of the receiver type takes precedence over an extension method
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

class C<T> {}

class X {}
class Y extends X {}
class Z extends Y {}

extension Ext<T> on C<T> {
  dynamic get getType => T;
}


main() {
  C c = C();
  C<X> x = C<X>();
  C<Y> y = C<Y>();
  C<Z> z = C<Z>();

  Expect.equals(dynamic, Ext(c).getType);

  Expect.equals(X, Ext(x).getType);
  Expect.equals(Object, Ext<Object>(x).getType);
  Expect.equals(X, Ext<X>(x).getType);

  Expect.equals(Y, Ext(y).getType);
  Expect.equals(Object, Ext<Object>(y).getType);
  Expect.equals(X, Ext<X>(y).getType);
  Expect.equals(Y, Ext<Y>(y).getType);

  Expect.equals(Z, Ext(z).getType);
  Expect.equals(Object, Ext<Object>(z).getType);
  Expect.equals(X, Ext<X>(z).getType);
  Expect.equals(Y, Ext<Y>(z).getType);
  Expect.equals(Z, Ext<Z>(z).getType);
}
