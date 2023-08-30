// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Mutable variable with no declared type, no
/// initialization⟩. A variable declaration of the form static? late? var id;
/// implicitly induces a setter with the header void set id(dynamic x), whose
/// execution sets the value of id to the incoming argument x.
///
/// @description Checks that the static type of an implicit setter of a mutable
/// variable with no declared type and no initialization is `dynamic`
/// @author sgrekhov22@gmail.com

late var x1;
var x2;

class C {
  static late var v1;
  late var v2;
  var v3;
  static var v4;
}

main() {
  x1 = -1;
  x1 = "1";
  x2 = 2;
  x2 = "2";

  C c = C();
  C.v1 = 1;
  C.v1 = "1";
  c.v2 = 2;
  c.v2 = "2";
  c.v3 = 3;
  c.v3 = "3";
  C.v4 = 4;
  C.v4 = "4";
}
