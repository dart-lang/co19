/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
class A {
  String result = "none";

  void set m(int val) {
    this.result = "A";
  }
}

class B extends A {
}