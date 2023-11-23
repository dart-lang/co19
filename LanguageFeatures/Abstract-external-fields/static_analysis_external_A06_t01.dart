// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An implementation specific compile-time error can be raised at an
/// external function declaration.
///
/// @description Checks that it is a compile time error to declare an external
/// variable on dart2js
/// @author sgrekhov@unipro.ru

external int i;
//           ^
// [web] unspecified

main() {
}
