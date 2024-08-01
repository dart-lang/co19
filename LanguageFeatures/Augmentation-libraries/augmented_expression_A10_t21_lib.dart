// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error if a variable with the
/// name `augmented` occurs in a control-flow element in a location where there
/// is an enclosing augmenting declaration. Test top level and instance members.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A10_t21.dart';

const augmented = 1;

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

augment class C {
  var instanceVariable = () {
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
  };

  void instanceMethod() {
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

  int get instanceGetter {
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
    return 0;
  }

  void set instanceSetter(int _) {
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

  int operator +(int other) {
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
    return 0;
  }
}

augment mixin M {
  var instanceVariable = () {
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
  };

  void instanceMethod() {
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

  int get instanceGetter {
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
    return 0;
  }

  void set instanceSetter(int _) {
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

  int operator +(int other) {
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
    return 0;
  }
}

augment enum E {
  augment e1;
  final instanceVariable = () {
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
  };

  void instanceMethod() {
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

  int get instanceGetter {
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
    return 0;
  }

  void set instanceSetter(int _) {
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

  int operator +(int other) {
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
    return 0;
  }
}

augment extension Ext {
  void instanceMethod() {
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

  int get instanceGetter {
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
    return 0;
  }

  void set instanceSetter(int _) {
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

  int operator +(int other) {
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
    return 0;
  }
}

extension type ET(int _) {
  void instanceMethod() {
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

  int get instanceGetter {
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
    return 0;
  }

  void set instanceSetter(int _) {
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

  int operator +(int other) {
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
    return 0;
  }
}
