// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each parameter p of m where covariant is present, it is a
/// compile-time error if there exists a direct or indirect superinterface of C
/// which has an accessible method signature m′′ with the same name as m, such
/// that m′′ has a parameter p′′ that corresponds to p, unless the type of p is
/// a subtype or a supertype of the type of p′′
///
/// @description Checks that it is not an error if there is a member with a
/// covariant-by-class parameter `p` and there is another member with the
/// same name but with the parameter which is a supertype of `p`
/// @author sgrekhov22@gmail.com

class A<T> {
  void m(T t) {}
  void set s(T t) {}
  void operator +(T t) {}
}

class C extends A<num> {
  void m(Object a) {}
  void set s(Object? a) {}
  void operator +(Object a) {}
}

main() {
  print(C);
}
