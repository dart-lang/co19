// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is as static warning if an identifier expression id occurs
/// inside a top level or static function (be it function, method, getter, or
/// setter) or variable initializer and there is no declaration d with name id
/// in the lexical scope enclosing the expression.
/// @description Checks that it is a compile error when an identifier expression
/// references an undeclared identifier in a library setter.
/// @author ilya


set setter (_) => undeclared;
//                ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  setter = 1;
}
