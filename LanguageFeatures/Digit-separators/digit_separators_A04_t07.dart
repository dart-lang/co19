// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Allow one or more `_`s between any two otherwise adjacent digits
/// of a `NUMBER` or `HEX_NUMBER` token. The following are not digits: The
/// leading `0x` or `0X` in `HEX_NUMBER`, and any `.`, `e`, `E`, `+` or `-` in
/// `NUMBER`.
///
/// That means only allowing `_`s between two `0-9` digits in `NUMBER` and
/// between two `0-9`, `a-f`, `A-F` digits in `HEX_NUMBER`.
///
/// @description Check that it is not an error if `.` is followed by `_m` and
/// there is an extension member named `_m`.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

extension on num {
  num get _42 => this;
}

extension on int {
  int get _14 => this;
}

main() {
  Expect.equals(3, 3._14);
  Expect.equals(1, 1._42);
}
