/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Likewise, if a type annotation is omitted on a formal parameter
 * in typedef declaration, it is taken to be dynamic.
 * @description Checks that function types with various types of formal
 * parameter are subtypes of given type t1 whose declaration omits parameter
 * types, therefore the type of formal parameter of t1 should be dynamic.
 * @static-clean
 * @author iefremov, sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

typedef F1(x);

typedef Func();
typedef Func2(int x);

main() {
  Expect.isTrue((int) {} is F1);
  Expect.isTrue((Object) {} is F1);
  Expect.isTrue((Func) {} is F1);
  Expect.isTrue((Func2) {} is F1);
}
