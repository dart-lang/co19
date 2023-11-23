// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The modifier required is added as a built-in identifier. The
/// grammar of function types is extended to allow any named parameter
/// declaration to be prefixed by the required modifier (e.g. int Function(int,
/// {int? y, required int z}).
///
/// @description Checks that the 'required' word cannot be used as a type name
/// @author sgrekhov@unipro.ru

typedef required = int Function(Object a, Object b);
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  required? l;
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
