// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: Inside an augmenting function body (including
///   factory constructors but not generative constructors) `augmented` refers
///   to the augmented function. Tear-offs are not allowed, and this function
///   must immediately be invoked.
///
/// @description Checks that it is a compile-time error if a variable with the
/// name `augmented` occurs in a control-flow element in an augmenting function
/// or a factory constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

var augmented = 0;

void topLevelFunction() {}

augment void topLevelFunction() {
  var list = [
    for (var augmented = 0; 1 > 2;) 0
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ];
  var map = {
    for (var i = 0; i > augmented;) i: i
//                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var set = {
    if (1 > augmented) 42
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

class C {
  C();
  factory C.f() => C();
  static void staticMethod() {}
  void instanceMethod() {}
}

augment class C {
  augment factory C.f() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return C();
  }

  augment static void staticMethod() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }

  augment void instanceMethod() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

mixin M {
  static void staticMethod() {}
  void instanceMethod() {}
}

augment mixin M {
  augment static void staticMethod()  {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }

  augment void instanceMethod() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

enum E {
  e1;
  static void staticMethod() {}
  void instanceMethod() {}
}

augment enum E {
  augment e1;
  augment static void staticMethod() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }

  augment void instanceMethod() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

class A {}
extension Ext on A {
  static void staticMethod() {}
  void instanceMethod() {}
}

augment extension Ext {
  augment static void staticMethod() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }

  augment void instanceMethod() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

extension type ET(int _) {
  factory ET.f() => ET(0);
  static void staticMethod() {}
  void instanceMethod() {}
}

augment extension type ET {
  augment factory ET.f() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return ET(0);
  }

  augment static void staticMethod() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }

  augment void instanceMethod() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
