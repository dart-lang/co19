// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a static warning if an assignment of the form v = e occurs
/// inside a top level or static function (be it function, method, getter, or
/// setter) or variable initializer and there is neither a local variable
/// declaration with name v nor setter declaration with name v = in the lexical
/// scope enclosing the assignment.
/// @description Checks that it is a compile error if an assignment of the form
/// v = e occurs inside a static function and there is neither a local
/// variable declaration with name v nor setter declaration with name v = in the
/// lexical scope enclosing the assignment.
/// @author sgrekhov@unipro.ru


class C {
  static test() {
    v = 1;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var v;
  C.test();
}
