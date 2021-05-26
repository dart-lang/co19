// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion An if statement of the form if (b) s1 else s2.
/// If:
/// • b shows that a variable v has type T .
/// • v is not potentially mutated in s1 or within a closure.
/// • If the variable v is accessed by a closure in s1 then the variable v is
///   not potentially mutated anywhere in the scope of v.
/// Then the type of v is known to be T in s1.
/// @description Checks that if b shows that v has type T and v is not
/// potentially mutated anywhere in the scope of v, then the type of v is
/// known to be T in s1, regardless of whether there are closures capturing v.
/// No closures, nested case.
/// @author ilya


class C {}
class D extends C {
  f() {}
}
class E extends D {
  g() {}
}

// formal parameter
f1(C x) {
  if (x is D) {
   if (x is E)
     x.g();
   else
     x.f();
  }
}

// local variable
f2(C y) {
  C x = y;
  if (x is D) {
   if (x is E)
     x.g();
   else
     x.f();
  }
}

main() {
  f1(new E());
  f2(new E());
}
