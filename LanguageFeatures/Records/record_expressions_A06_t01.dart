// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The expression () refers to the constant empty record with no
/// fields.
///
/// @description Checks that the expression () refers to the constant empty
/// record with no positional fields.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

() foo() => ();

main() {
  var record1 = ();
  record1.$0;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  foo().$0;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}
