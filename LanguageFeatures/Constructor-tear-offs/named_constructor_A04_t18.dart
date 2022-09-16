// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Similarly, [params] is almost exactly the same parameter list
/// as the constructor [C.name], with the one exception that initializing
/// formals are represented by normal parameters with the same name and type.
/// All remaining properties of the parameters are the same as for the
/// corresponding constructor parameter, including any default values, and
/// [args] is an argument list passing those parameters to [C.name] directly as
/// they are received.
///
/// @description Checks statically that initializing formals are represented by
/// normal parameters with the same name and type - test additional parameters.
/// @author iarkh@unipro.ru

class C {
  int? j = 0;
  String s = "";

  C.constr([this.j, this.s = "default"]);
}

main() {
  var v = C.constr;

  v(incorrect: 1);
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  v("");
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  v(null, 1);
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  v("", "");
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}
