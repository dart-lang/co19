/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks first time initialization via type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../Utils/expect.dart';

typedef IntAlias = int;
typedef NumAlias = num;
typedef DoubleAlias = double;
typedef BoolAlias = bool;
typedef StringAlias = String;

main() {
  IntAlias i = 1;
  NumAlias n = 3.14;
  DoubleAlias d = 3.1415;
  BoolAlias b = true;
  StringAlias s = "Lily was here";

  var ii = i;
  var nn = n;
  var dd = d;
  var bb = b;
  var ss = s;

  Expect.equals(1, ii);
  Expect.equals(3.14, nn);
  Expect.equals(3.1415, dd);
  Expect.isTrue(bb);
  Expect.equals("Lily was here", ss);

  Expect.isTrue(ii is int);
  Expect.isTrue(nn is num);
  Expect.isFalse(nn is int);
  Expect.isTrue(dd is double);
  Expect.isTrue(bb is bool);
  Expect.isTrue(ss is String);
}
