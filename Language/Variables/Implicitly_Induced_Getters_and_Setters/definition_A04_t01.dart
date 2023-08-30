// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Mutable variable with no declared type, with
/// initialization⟩.
/// A variable declaration of the form static? late? var id = e; implicitly
/// induces a setter with the header void set id(dynamic x), whose execution
/// sets the value of id to the incoming argument x.
/// Type inference could have provided a type different from dynamic.
///
/// @description Checks that the static type of an implicit setter of a mutable
/// variable with no declared type but with an initialization is provided by the
/// type inference
/// @author sgrekhov22@gmail.com

late var x1 = 1;
var x2 = 2;

class C {
  static late var v1 = 1;
  late var v2 = 2;
  var v3 = 3;
  static var v4 = 4;
}

main() {
  x1 = -1;
  x2 = -2;
  try {
    x1 = "1" as dynamic;
  } catch (_) {}
  try {
    x2 = "2" as dynamic;
  } catch (_) {}

  C c = C();
  C.v1 = -1;
  c.v2 = -2;
  c.v3 = -3;
  C.v4 = -4;
  try {
    C.v1 = "1" as dynamic;
  } catch (_) {}
  try {
    c.v2 = "2" as dynamic;
  } catch (_) {}
  try {
    c.v3 = "3" as dynamic;
  } catch (_) {}
  try {
    C.v4 = "4" as dynamic;
  } catch (_) {}
}
