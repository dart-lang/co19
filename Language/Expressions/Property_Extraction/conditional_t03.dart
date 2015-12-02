/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a conditional property extraction expression e of
 * the form e1?.id is equivalent to the evaluation of the expression
 * ((x) => x == null?null : x.id)(e1).
 * @description Check that e1?.id is equivalent to
 * ((x) => x == null?null : x.id)(e1). Test that static property is not
 * returned by ?. extraction
 * @issue 25087
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  static String id = "id";
}

main() {
  Expect.throws(() {C?.id;}, (e) => e is NoSuchMethodError);
}
