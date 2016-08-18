/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The name of the unary operator - is unary-.
 * @description Checks that the name of unary operator - is 'unary-'
 * @author ilya
 * @author sgrekhov@unipro.ru
 */

import 'dart:mirrors';
import '../../../../Utils/expect.dart';

class C {
  operator - () {}
}

main() {
  Expect.isNotNull(reflectClass(C).instanceMembers[const Symbol('unary-')]);
}
