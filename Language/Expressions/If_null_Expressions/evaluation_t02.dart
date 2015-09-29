/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an if-null expression e of the form e1 ??e2 is
 * equivalent to the evaluation of the expression ((x) => x == null?e2 : x)(e1).
 *
 * @description Check evaluation result
 *
 * @author a.semenov@unipro.ru
 */
import '../../../Utils/expect.dart';


e1(var r) {
  return r;
}

e2(var r) {
  return r;
}

e3(var r) {
  return r;
}

main() {
  Expect.equals(1, e1(1) ?? e2(2));
  Expect.equals(1, e1(1) ?? e2(null));
  Expect.equals(2, e1(null) ?? e2(2));
  Expect.equals(null, e1(null) ?? e2(null));

  Expect.equals('aaa', e1('aaa') ?? e2('bbb'));
  Expect.equals('aaa', e1('aaa') ?? e2(null));
  Expect.equals('bbb', e1(null) ?? e2('bbb'));
  Expect.equals(null, e1(null) ?? e2(null));


  Expect.equals(1, e1(1) ?? e2(2) ?? e3(3));
  Expect.equals(1, e1(1) ?? e2(null) ?? e3(3));
  Expect.equals(1, e1(1) ?? e2(null) ?? e3(null));
  Expect.equals(2, e1(null) ?? e2(2) ?? e3(3));
  Expect.equals(3, e1(null) ?? e2(null) ?? e3(3));
  Expect.equals(null, e1(null) ?? e2(null) ?? e3(null));

  Expect.equals('aaa', e1('aaa') ?? e2('bbb') ?? e3('ccc'));
  Expect.equals('aaa', e1('aaa') ?? e2(null) ?? e3('ccc'));
  Expect.equals('aaa', e1('aaa') ?? e2(null) ?? e3(null));
  Expect.equals('bbb', e1(null) ?? e2('bbb') ?? e3('ccc'));
  Expect.equals('ccc', e1(null) ?? e2(null) ?? e3('ccc'));
}
