// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The static type of a function literal of the form
/// (T1 a1,...,Tn an, [Tn+1 xn+1 = d1,...,Tn+k xn+k = dk]) {s} is
/// (T1,...,Tn, [Tn+1 xn+1,...,Tn+k xn+k]) -> dynamic.
/// In any case where Ti, 1 <= i <= n + k, is not specified, it is considered
/// to have been specified as dynamic.
/// @description Checks that a compile error occurs when assigning a
/// function literal of the form
/// (T1 a1,...,Tn an, [Tn+1 xn+1 = d1,...,Tn+k xn+k = dk]) {s}
/// to a variable whose type is not a function type.
/// @author msyabro
/// @reviewer rodionov


main() {
  bool b = (int x, int y, [double a, double b]) {var x = 0; ++x; return ++x;};
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}
