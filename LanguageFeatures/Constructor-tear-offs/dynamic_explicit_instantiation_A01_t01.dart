// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We do not allow dynamic explicit instantiation. If an expression
/// e has type dynamic (or Never), then e.foo<int> is a compile-time error for
/// any name foo. (It'd be valid for a member of Object that was a generic
/// function, but none of the Object members are generic functions). It's not
/// possible to do implicit instantiation without knowing the member signature.
///
/// @description Checks that dynamic explicit instantiation is a compile-time
/// error
/// @author sgrekhov@unipro.ru

main() {
  dynamic d = new Object();
  d.foo<int>;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
