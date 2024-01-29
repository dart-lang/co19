// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function expression invocation i has the form
/// ef <A1, . . . , Ar>(a1, . . . , an, xn+1: an+1, . . . , xn+k: an+k),
/// where ef is an expression.
/// ...
/// Let F be the static type of ef . If F is an interface type that has a method
/// named call, i is treated as the ordinary invocation
/// ef .call<A1, . . . , Ar>(a1, . . . , an, xn+1: an+1, . . . , xn+k: an+k)
///
/// @description Checks that it is a compile-time error to invoke a record
/// that has a getter named `call`.
/// @author sgrekhov22@gmail.com
/// @issue 54616,54651

void main() {
  var r = (call: () => 42);
  r();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
  r.call(); // Ok
}
