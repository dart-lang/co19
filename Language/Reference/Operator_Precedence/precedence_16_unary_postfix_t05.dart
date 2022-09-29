// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
/// Description    Operator                          Associativity Precedence
/// Unary postfix  ., ?., e++, e–-, e1[e2], e1(), ()  None           16
/// @description Test that '[]' unary postfix operator ha highest
/// precedence (16). Compare with Unary prefix (precedence 15). Test that
/// '[]' has priority higher than -
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  List<int> l = [1];
  Expect.equals(-1, -l[0]);
}
