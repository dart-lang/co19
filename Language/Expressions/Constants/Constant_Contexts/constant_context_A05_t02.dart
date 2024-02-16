// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be an expression; e occurs in a constant context iff one of
/// the following applies:
/// ...
/// • e is an immediate subexpression of an expression e0 which occurs in a
///   constant context, where e0 is not a function literal
///
/// @description Checks that it is a compile-time error if `e` is an immediate
/// subexpression of an expression `e0` which occurs in a constant context but
/// `e0` is a function literal
/// @author sgrekhov22@gmail.com

class C {
  final val;
  const C(this.val);
}

main() {
  const c1 = (){C(1);};
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var c2 = const (){C(1);};
//               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var c3 = const [(){C(1);}];
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
