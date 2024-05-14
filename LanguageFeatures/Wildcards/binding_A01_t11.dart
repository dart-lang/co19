// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that no entry named `_` is introduced into the enclosing
/// scope by a wildcarded declaration. Test function literals calling
/// constructors and functions tear-offs
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class A {
  A(_);
  A.constr([int _ = 1]);
}

void topLevelFunction1(int _) {}
void topLevelFunction2([int _ = 1]) {}

class C {
  static void staticMethod1(int _) {}
  static void staticMethod2([int _ = 2]) {}
  void instanceMethod1(int _) {}
  void instanceMethod2([int _ = 3]) {}
}

mixin M {
  static void staticMethod1(int _) {}
  static void staticMethod2([int _ = 4]) {}
  void instanceMethod1(int _) {}
  void instanceMethod2([int _ = 5]) {}
}

enum E {
  e1;
  static void staticMethod1(int _) {}
  static void staticMethod2([int _ = 6]) {}
  void instanceMethod1(int _) {}
  void instanceMethod2([int _ = 7]) {}
}

extension type ET(int id) {
  static void staticMethod1(int _) {}
  static void staticMethod2([int _ = 8]) {}
  void instanceMethod1(int _) {}
  void instanceMethod2([int _ = 9]) {}
}

class D {}
extension Ext on D {
  static void staticMethod1(int _) {}
  static void staticMethod2([int _ = 2]) {}
  void instanceMethod1(int _) {}
  void instanceMethod2([int _ = 3]) {}
}

class MA = Object with M;

main() {
  void localFunction1(int _) {}
  void localFunction2([int _ = 12]) {}
  var functionExpression1 = (int _) {};
  var functionExpression2 = ([int _ = 13]) {};

  var to1 = A.new;
  var f1 = (_) {
    A.new(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    to1(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to2 = A.constr;
  var f2 = (_) {
    A.constr(_);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
    to2(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to3 = topLevelFunction1;
  var f3 = (_) {
    topLevelFunction1(_);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    to3(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to4 = topLevelFunction2;
  var f4 = (_) {
    topLevelFunction2(_);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    to4(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to5 = C.staticMethod1;
  var f5 = (_) {
    C.staticMethod1(_);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
    to5(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to6 = C.staticMethod2;
  var f6 = (_) {
    C.staticMethod2(_);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
    to6(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to7 = C().instanceMethod1;
  var f7 = (_) {
    C().instanceMethod1(_);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
    to7(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to8 = C().instanceMethod2;
  var f8 = (_) {
    C().instanceMethod2(_);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
    to8(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to9 = M.staticMethod1;
  var f9 = (_) {
    M.staticMethod1(_);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
    to9(_);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to10 = M.staticMethod2;
  var f10 = (_) {
    M.staticMethod2(_);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
    to10(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to11 = MA().instanceMethod1;
  var f11 = (_) {
    MA().instanceMethod1(_);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
    to11(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to12 = MA().instanceMethod2;
  var f12 = (_) {
    MA().instanceMethod2(_);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
    to12(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to13 = E.staticMethod1;
  var f13 = (_) {
    E.staticMethod1(_);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
    to13(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to14 = E.staticMethod2;
  var f14 = (_) {
    E.staticMethod2(_);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
    to14(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to15 = E.e1.instanceMethod1;
  var f15 = (_) {
    E.e1.instanceMethod1(_);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
    to15(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to16 = E.e1.instanceMethod2;
  var f16 = (_) {
    E.e1.instanceMethod2(_);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
    to16(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to17 = ET.staticMethod1;
  var f17 = (_) {
    ET.staticMethod1(_);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
    to17(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to18 = ET.staticMethod2;
  var f18 = (_) {
    ET.staticMethod2(_);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
    to18(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to19 = ET(0).instanceMethod1;
  var f19 = (_) {
    ET(0).instanceMethod1(_);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
    to19(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to20 = ET(0).instanceMethod2;
  var f20 = (_) {
    ET(0).instanceMethod2(_);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
    to20(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to21 = Ext.staticMethod1;
  var f21 = (_) {
    Ext.staticMethod1(_);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    to21(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to22 = Ext.staticMethod2;
  var f22 = (_) {
    Ext.staticMethod2(_);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
    to22(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to23 = D().instanceMethod1;
  var f23 = (_) {
    D().instanceMethod1(_);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
    to23(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to24 = D().instanceMethod2;
  var f24 = (_) {
    D().instanceMethod2(_);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
    to24(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to25 = localFunction1;
  var f25 = (_) {
    localFunction1(_);
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    to25(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to26 = localFunction2;
  var f26 = (_) {
    localFunction2(_);
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    to26(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to27 = functionExpression1;
  var f27 = (_) {
    functionExpression1(_);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
    to27(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var to28 = functionExpression2;
  var f28 = (_) {
    functionExpression2(_);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
    to28(_);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
