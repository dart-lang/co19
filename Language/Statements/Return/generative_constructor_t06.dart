// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a return statement of the form
/// `return e;` appears in a generative constructor.
///
/// @description Checks that it is not an error if a return statement of
/// the form `return;` appears in the body part of a primary constructor.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

class C(var int? v) {
  this {
    v = 0;
    return;
    v = 1;  // ignore: dead_code
  }
}

String log = '';

extension type ET(int v) {
  this {
    log = 'before';
    return;
    log = 'after'; // ignore: dead_code
  }
}

main() {
  Expect.equals(0, C().v);
  ET(0);
  Expect.equals('before', log);
}
