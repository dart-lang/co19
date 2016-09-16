/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an if-null expression e of the form e1??e2 is
 * equivalent ... The static type of e is least upper bound of the
 * static type of e1 and the static type of e2 .
 *
 * @description Check that static type of expression e1 ?? e2 is least upper
 * bound of the static type of e1 and the static type of e2 .
 *
 * @author a.semenov@unipro.ru
 * @author sgrekhov@unipro.ru
 *
 */
import 'dart:collection';
import '../../../Utils/expect.dart';

main() {
  var x1 = 1.0 ?? 2.0;
  Expect.isTrue(x1 is double);

  var x2 = null ?? 2.0;
  Expect.isTrue(x2 is double);

  var x3 = 'aaa' ?? 'bbb';
  Expect.isTrue(x3 is String);

  var x4 = true ?? false;
  Expect.isTrue(x4 is bool);

  var x5 = new LinkedHashMap() ?? new SplayTreeMap();
  Expect.isTrue(x5 is LinkedHashMap);

  var x6 = 'aaa' ?? null;
  Expect.isTrue(x6 is String);
}

