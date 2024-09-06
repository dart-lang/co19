// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error to use `augmented` as a
/// constant value in a switch expressions and statements in a non-augmenting
/// member declaration inside an augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A10_t13.dart';

augment class C {
  static var staticVariable = () {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  };

  static void staticMethod() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  static int get staticGetter {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
    return 0;
  }

  static void set staticSetter(int _) {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  var instanceVariable = () {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  };

  void instanceMethod() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  int get instanceGetter {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
    return 0;
  }

  void set instanceSetter(int _) {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }
}

augment mixin M {
  static var staticVariable = () {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  };

  static void staticMethod() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  static int get staticGetter {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
    return 0;
  }

  static void set staticSetter(int _) {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  var instanceVariable = () {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  };

  void instanceMethod() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  int get instanceGetter {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
    return 0;
  }

  void set instanceSetter(int _) {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }
}

augment enum E {
  augment e1;
  static var staticVariable = () {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  };

  static void staticMethod() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  static int get staticGetter {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
    return 0;
  }

  static void set staticSetter(int _) {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  void instanceMethod() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  int get instanceGetter {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
    return 0;
  }

  void set instanceSetter(int _) {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }
}

augment extension Ext {
  static var staticVariable = () {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  };

  static void staticMethod() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  static int get staticGetter {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
    return 0;
  }

  static void set staticSetter(int _) {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  void instanceMethod() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }

  int get instanceGetter {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
    return 0;
  }

  void set instanceSetter(int _) {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }
}
