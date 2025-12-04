// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// - A function is not complete after all augmentations are applied, unless
///   it's an instance member and the surrounding class is abstract.
///
/// @description Checks that it is not an error if a function is made complete
/// by an augmentation by adding a body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
part 'augmenting_functions_A08_t02_lib.dart';

String topLevelFunction1();
String topLevelFunction2([int v]);
String topLevelFunction3({int v});

augment String topLevelFunction1() => "Body";
augment String topLevelFunction2([int v]) => "Body. v=$v";
augment String topLevelFunction3({int v}) {
  return "Body. v=$v";
}

class C {
  static String staticMethod1();
  static String staticMethod2([int v]);
  static String staticMethod3({int v});

  String instanceMethod1();
  String instanceMethod2([int v]);
  String instanceMethod3({int v});
}

augment class C {
  augment String staticMethod1() => "Body";
  augment String staticMethod2([int v]) => "Body. v=$v";
  augment String staticMethod3({int v}) {
    return "Body. v=$v";
  }
  augment String instanceMethod1() => "Body";
  augment String instanceMethod2([int v]) => "Body. v=$v";
  augment String instanceMethod3({int v}) {
    return "Body. v=$v";
  }
}

mixin M {
  static String staticMethod1();
  static String staticMethod2([int v]);
  static String staticMethod3({int v});

  String instanceMethod1();
  String instanceMethod2([int v]);
  String instanceMethod3({int v});
}

augment mixin M {
  augment String staticMethod1() => "Body";
  augment String staticMethod2([int v]) => "Body. v=$v";
  augment String staticMethod3({int v}) {
    return "Body. v=$v";
  }
  augment String instanceMethod1() => "Body";
  augment String instanceMethod2([int v]) => "Body. v=$v";
  augment String instanceMethod3({int v}) {
    return "Body. v=$v";
  }
}

enum E {
  e1;
  static String staticMethod1();
  static String staticMethod2([int v]);
  static String staticMethod3({int v});

  String instanceMethod1();
  String instanceMethod2([int v]);
  String instanceMethod3({int v});
}

augment enum E {
  ;
  augment String staticMethod1() => "Body";
  augment String staticMethod2([int v]) => "Body. v=$v";
  augment String staticMethod3({int v}) {
    return "Body. v=$v";
  }
  augment String instanceMethod1() => "Body";
  augment String instanceMethod2([int v]) => "Body. v=$v";
  augment String instanceMethod3({int v}) {
    return "Body. v=$v";
  }
}

class A {}

extension Ext on A {
  static String staticMethod1();
  static String staticMethod2([int v]);
  static String staticMethod3({int v});

  String instanceMethod1();
  String instanceMethod2([int v]);
  String instanceMethod3({int v});
}

augment extension Ext {
  augment String staticMethod1() => "Body";
  augment String staticMethod2([int v]) => "Body. v=$v";
  augment String staticMethod3({int v}) {
    return "Body. v=$v";
  }
  augment String instanceMethod1() => "Body";
  augment String instanceMethod2([int v]) => "Body. v=$v";
  augment String instanceMethod3({int v}) {
    return "Body. v=$v";
  }
}

extension type ET(int _) {
  static String staticMethod1();
  static String staticMethod2([int v]);
  static String staticMethod3({int v});

  String instanceMethod1();
  String instanceMethod2([int v]);
  String instanceMethod3({int v});
}

augment extension type ET {
  augment String staticMethod1() => "Body";
  augment String staticMethod2([int v]) => "Body. v=$v";
  augment String staticMethod3({int v}) {
    return "Body. v=$v";
  }
  augment String instanceMethod1() => "Body";
  augment String instanceMethod2([int v]) => "Body. v=$v";
  augment String instanceMethod3({int v}) {
    return "Body. v=$v";
  }
}

class MA = Object with M;

main() {
  Expect.equals("Body", topLevelFunction1());
  Expect.equals("Body. v=2", topLevelFunction2());
  Expect.equals("Body, v=3", topLevelFunction3());

  Expect.equals("Body", C.staticMethod1());
  Expect.equals("Body. v=2", C.staticMethod2());
  Expect.equals("Body. v=3", C.staticMethod3());
  Expect.equals("Body", C().instanceMethod1());
  Expect.equals("Body. v=2", C().instanceMethod2());
  Expect.equals("Body. v=3", C().instanceMethod3());

  Expect.equals("Body", M.staticMethod1());
  Expect.equals("Body. v=2", M.staticMethod2());
  Expect.equals("Body. v=3", M.staticMethod3());
  Expect.equals("Body", MA().instanceMethod1());
  Expect.equals("Body. v=2", MA().instanceMethod2());
  Expect.equals("Body. v=3", MA().instanceMethod3());

  Expect.equals("Body", E.staticMethod1());
  Expect.equals("Body. v=2", E.staticMethod2());
  Expect.equals("Body. v=3", E.staticMethod3());
  Expect.equals("Body", E.e1.instanceMethod1());
  Expect.equals("Body. v=2", E.e1.instanceMethod2());
  Expect.equals("Body. v=3", E.e1.instanceMethod3());

  Expect.equals("Body", Ext.staticMethod1());
  Expect.equals("Body. v=2", Ext.staticMethod2());
  Expect.equals("Body. v=3", Ext.staticMethod3());
  Expect.equals("Body", A().instanceMethod1());
  Expect.equals("Body. v=2", A().instanceMethod2());
  Expect.equals("Body. v=3", A().instanceMethod3());

  Expect.equals("Body", ET.staticMethod1());
  Expect.equals("Body. v=2", ET.staticMethod2());
  Expect.equals("Body. v=3", ET.staticMethod3());
  Expect.equals("Body", ET(0).instanceMethod1());
  Expect.equals("Body. v=2", ET(0).instanceMethod2());
  Expect.equals("Body. v=3", ET(0).instanceMethod3());
}
