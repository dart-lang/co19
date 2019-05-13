/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e be a new expression of the form
 * new T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) or the form
 * new T(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 * @description Checks that it no compile error if T is a type alias that does
 * denote a class.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../../Utils/expect.dart';

class C<T1, T2> {
  String log;
  C() {
    log = "default";
  }
  C.named() {
    log = "named";
  }
}

typedef CAlias<T> = C<T, String>;

main() {
  CAlias c1 = new CAlias();
  Expect.isTrue(c1 is C<dynamic, String>);
  Expect.isTrue(c1 is CAlias<dynamic>);
  Expect.equals("default", c1.log);

  CAlias<int> c2 = new CAlias<int>.named();
  Expect.isTrue(c2 is C<int, String>);
  Expect.isTrue(c2 is CAlias<int>);
  Expect.equals("named", c2.log);

  CAlias<int> c3 = new C<int, String>();
  Expect.isTrue(c3 is C<int, String>);
  Expect.isTrue(c3 is CAlias<int>);
  Expect.equals("default", c3.log);

  CAlias<int> c4 = new C<int, String>.named();
  Expect.isTrue(c4 is C<int, String>);
  Expect.isTrue(c4 is CAlias<int>);
  Expect.equals("named", c4.log);

  C<int, String> c5 = new CAlias<int>();
  Expect.isTrue(c5 is C<int, String>);
  Expect.isTrue(c5 is CAlias<int>);
  Expect.equals("default", c5.log);

  C<int, String> c6 = new CAlias<int>.named();
  Expect.isTrue(c6 is C<int, String>);
  Expect.isTrue(c6 is CAlias<int>);
  Expect.equals("named", c6.log);
}
