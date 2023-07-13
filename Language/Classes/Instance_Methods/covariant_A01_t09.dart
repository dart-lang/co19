// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each parameter p of m where covariant is present, it is a
/// compile-time error if there exists a direct or indirect superinterface of C
/// which has an accessible method signature m′′ with the same name as m, such
/// that m′′ has a parameter p′′ that corresponds to p, unless the type of p is
/// a subtype or a supertype of the type of p′′
///
/// @description Checks that it is not an error if there is a member
/// with a covariant parameter `p` and there is another member with the same
/// name but with the parameter which is a subtype of `p`
/// @author sgrekhov22@gmail.com

class A {
  void m1(covariant Object a) {}
  void m2([covariant Object a = ""]) {}
  void m3({covariant Object a = ""}) {}
  void m4({required covariant Object a}) {}

  void set s(covariant Object s) {}
  void operator +(covariant Object n) {}
}

class C extends A {
  void m1(num a) {}
  void m2([num a = 0]) {}
  void m3({num a = 0}) {}
  void m4({required num a}) {}

  void set s(num n) {}
  void operator +(num n) {}
}

main() {
  print(C);
}
