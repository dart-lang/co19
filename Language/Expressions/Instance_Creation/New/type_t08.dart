// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be a new expression of the form
/// new T.id(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k) or the form
/// new T(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k).
/// @description Checks that it no compile error if T is a type alias that does
/// denote a class.
/// @author sgrekhov@unipro.ru

import '../../../../Utils/expect.dart';

class C {
  String log = "";

  C() {
    log = "default";
  }

  C.named() {
    log = "named";
  }
}

typedef CAlias = C;

main() {
  CAlias c1 = new CAlias();
  Expect.isTrue(c1 is C);
  Expect.isTrue(c1 is CAlias);
  Expect.runtimeIsType<C>(c1);
  Expect.runtimeIsType<CAlias>(c1);
  Expect.equals("default", c1.log);

  CAlias c2 = new CAlias.named();
  Expect.isTrue(c2 is C);
  Expect.isTrue(c2 is CAlias);
  Expect.runtimeIsType<C>(c2);
  Expect.runtimeIsType<CAlias>(c2);
  Expect.equals("named", c2.log);

  CAlias c3 = new C();
  Expect.isTrue(c3 is C);
  Expect.isTrue(c3 is CAlias);
  Expect.runtimeIsType<C>(c3);
  Expect.runtimeIsType<CAlias>(c3);
  Expect.equals("default", c3.log);

  CAlias c4 = new C.named();
  Expect.isTrue(c4 is C);
  Expect.isTrue(c4 is CAlias);
  Expect.runtimeIsType<C>(c4);
  Expect.runtimeIsType<CAlias>(c4);
  Expect.equals("named", c4.log);

  C c5 = new CAlias();
  Expect.isTrue(c5 is C);
  Expect.isTrue(c5 is CAlias);
  Expect.runtimeIsType<C>(c5);
  Expect.runtimeIsType<CAlias>(c5);
  Expect.equals("default", c5.log);

  C c6 = new CAlias.named();
  Expect.isTrue(c6 is C);
  Expect.isTrue(c6 is CAlias);
  Expect.runtimeIsType<C>(c6);
  Expect.runtimeIsType<CAlias>(c6);
  Expect.equals("named", c6.log);
}
