// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be a new expression of the form
/// new T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) or the form
/// new T(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
/// @description Checks that it no compile error if T is a type alias that does
/// denote a class.
/// @author sgrekhov@unipro.ru

import '../../../../Utils/expect.dart';

class C<T1, T2> {
  String log = "";

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
  checkType(checkIs<C<dynamic, String>>, true, c1);
  checkType(checkIs<CAlias<dynamic>>, true, c1);
  Expect.equals("default", c1.log);

  CAlias<int> c2 = new CAlias<int>.named();
  checkType(checkIs<C<int, String>>, true, c2);
  checkType(checkIs<CAlias<int>>, true, c2);
  Expect.equals("named", c2.log);

  CAlias<int> c3 = new C<int, String>();
  checkType(checkIs<C<int, String>>, true, c3);
  checkType(checkIs<CAlias<int>>, true, c3);
  Expect.equals("default", c3.log);

  CAlias<int> c4 = new C<int, String>.named();
  checkType(checkIs<C<int, String>>, true, c4);
  checkType(checkIs<CAlias<int>>, true, c4);
  Expect.equals("named", c4.log);

  C<int, String> c5 = new CAlias<int>();
  checkType(checkIs<C<int, String>>, true, c5);
  checkType(checkIs<CAlias<int>>, true, c5);
  Expect.equals("default", c5.log);

  C<int, String> c6 = new CAlias<int>.named();
  checkType(checkIs<C<int, String>>, true, c6);
  checkType(checkIs<CAlias<int>>, true, c6);
  Expect.equals("named", c6.log);
}
