/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
library getter_invocation_lib;
import '../../../../Utils/expect.dart';

class A {
  String get className => "A";
  bool executed = false;
  int get m {
    this.executed = true;
    Expect.equals(this.className, "C");
    return 1;
  }

  int get g => 10;
}
