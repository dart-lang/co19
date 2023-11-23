// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String toStringAsFixed(int fractionDigits)
/// The parameter fractionDigits must be an integer satisfying:
/// 0 <= fractionDigits <= 20.
/// @description Checks that compile error occurs if [fractionDigits] is
/// statically [:null:].
/// @author iarkh


double d = 10.0;

main() {
   d.toStringAsFixed(null);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}
