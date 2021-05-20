// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of a conditional property extraction expression e of
/// the form e1?.id is equivalent to the evaluation of the expression
/// ((x) => x == null?null : x.id)(e1). The static type of e is the same as the
/// static type of e1.id.
/// @description Check that static type of the e?.id is the same as e.id. Test
/// getter
/// @author sgrekhov@unipro.ru


class C {
  int get m => 1;
}

main() {
  var c = new C() as C?;
  int? x = c?.m;
}
