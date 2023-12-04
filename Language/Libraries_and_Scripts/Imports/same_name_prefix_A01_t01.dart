// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the prefix used in a deferred
/// import is also used as the prefix of another import clause
///
/// @description Checks that it is a compile-time error if the prefix used in a
/// deferred import is also used as the prefix of another deferred import clause
/// @author sgrekhov22@gmail.com

import 'static_type_lib.dart' deferred as p;
//                            ^^^^^^^^
// [analyzer] unspecified

import 'syntax_lib.dart' deferred as p;
//                       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  p.loadLibrary();
}
