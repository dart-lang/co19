// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `T` be the actual returned type of a function literal as
/// computed above. Let `R` be the greatest closure of the typing context `K` as
/// computed above.
///
/// With null safety: if `R` is `void`, or the function literal is marked
/// `async` and `R` is `FutureOr<void>`, let `S` be `void`.
///
/// Otherwise, if `T <: R` then let `S` be `T`. Otherwise, let `S` be `R`. The
/// inferred return type of the function literal is then defined as follows:
/// - If the function literal is marked `async` then the inferred return type is
///   `Future<flatten(S)>`.
/// - If the function literal is marked `async*` then the inferred return type
///   is `Stream<S>`.
/// - If the function literal is marked `sync*` then the inferred return type is
///   `Iterable<S>`.
/// - Otherwise, the inferred return type is `S`.
///
/// @description Check that if actual return type is `void`, then the inferred
/// return type of the function literal is `void`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void getVoid() {}

var f1 = () {
  return getVoid();
};
var f2 = () {
  if (1 > 2) {
    return getVoid();
  }
};
var f3 = () {
  if (1 > 2) {
    return 42 as dynamic;
  }
  return getVoid();
};
var f4 = () {
  if (1 > 2) {
    return null;
  }
  return getVoid();
};

class C {
  static var sf1 = () {
    return getVoid();
  };
  static var sf2 = () {
    if (1 > 2) {
      return getVoid();
    }
  };
  static var sf3 = () {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getVoid();
  };
  static var sf4 = () {
    if (1 > 2) {
      return null;
    }
    return getVoid();
  };


  var f1 = () {
    return getVoid();
  };
  var f2 = () {
    if (1 > 2) {
      return getVoid();
    }
  };
  var f3 = () {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getVoid();
  };
  var f4 = () {
    if (1 > 2) {
      return null;
    }
    return getVoid();
  };
}

mixin M {
  static var sf1 = () {
    return getVoid();
  };
  static var sf2 = () {
    if (1 > 2) {
      return getVoid();
    }
  };
  static var sf3 = () {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getVoid();
  };
  static var sf4 = () {
    if (1 > 2) {
      return null;
    }
    return getVoid();
  };


  var f1 = () {
    return getVoid();
  };
  var f2 = () {
    if (1 > 2) {
      return getVoid();
    }
  };
  var f3 = () {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getVoid();
  };
  var f4 = () {
    if (1 > 2) {
      return null;
    }
    return getVoid();
  };
}

mixin class MC {
  static var sf1 = () {
    return getVoid();
  };
  static var sf2 = () {
    if (1 > 2) {
      return getVoid();
    }
  };
  static var sf3 = () {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getVoid();
  };
  static var sf4 = () {
    if (1 > 2) {
      return null;
    }
    return getVoid();
  };


  var f1 = () {
    return getVoid();
  };
  var f2 = () {
    if (1 > 2) {
      return getVoid();
    }
  };
  var f3 = () {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getVoid();
  };
  var f4 = () {
    if (1 > 2) {
      return null;
    }
    return getVoid();
  };
}

enum E {
  e0;

  static var sf1 = () {
    return getVoid();
  };
  static var sf2 = () {
    if (1 > 2) {
      return getVoid();
    }
  };
  static var sf3 = () {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getVoid();
  };
  static var sf4 = () {
    if (1 > 2) {
      return null;
    }
    return getVoid();
  };
}

class A {}

extension Ext on A {
  static var sf1 = () {
    return getVoid();
  };
  static var sf2 = () {
    if (1 > 2) {
      return getVoid();
    }
  };
  static var sf3 = () {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getVoid();
  };
  static var sf4 = () {
    if (1 > 2) {
      return null;
    }
    return getVoid();
  };
}

extension type ET(int _) {
  static var sf1 = () {
    return getVoid();
  };
  static var sf2 = () {
    if (1 > 2) {
      return getVoid();
    }
  };
  static var sf3 = () {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getVoid();
  };
  static var sf4 = () {
    if (1 > 2) {
      return null;
    }
    return getVoid();
  };
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<void Function()>>();
  f2.expectStaticType<Exactly<void Function()>>();
  f3.expectStaticType<Exactly<void Function()>>();
  f4.expectStaticType<Exactly<void Function()>>();

  C.sf1.expectStaticType<Exactly<void Function()>>();
  C.sf2.expectStaticType<Exactly<void Function()>>();
  C.sf3.expectStaticType<Exactly<void Function()>>();
  C.sf4.expectStaticType<Exactly<void Function()>>();
  C().f1.expectStaticType<Exactly<void Function()>>();
  C().f2.expectStaticType<Exactly<void Function()>>();
  C().f3.expectStaticType<Exactly<void Function()>>();
  C().f4.expectStaticType<Exactly<void Function()>>();

  M.sf1.expectStaticType<Exactly<void Function()>>();
  M.sf2.expectStaticType<Exactly<void Function()>>();
  M.sf3.expectStaticType<Exactly<void Function()>>();
  M.sf4.expectStaticType<Exactly<void Function()>>();
  MA().f1.expectStaticType<Exactly<void Function()>>();
  MA().f2.expectStaticType<Exactly<void Function()>>();
  MA().f3.expectStaticType<Exactly<void Function()>>();
  MA().f4.expectStaticType<Exactly<void Function()>>();

  MC.sf1.expectStaticType<Exactly<void Function()>>();
  MC.sf2.expectStaticType<Exactly<void Function()>>();
  MC.sf3.expectStaticType<Exactly<void Function()>>();
  MC.sf4.expectStaticType<Exactly<void Function()>>();
  MC().f1.expectStaticType<Exactly<void Function()>>();
  MC().f2.expectStaticType<Exactly<void Function()>>();
  MC().f3.expectStaticType<Exactly<void Function()>>();
  MC().f4.expectStaticType<Exactly<void Function()>>();

  E.sf1.expectStaticType<Exactly<void Function()>>();
  E.sf2.expectStaticType<Exactly<void Function()>>();
  E.sf3.expectStaticType<Exactly<void Function()>>();
  E.sf4.expectStaticType<Exactly<void Function()>>();

  Ext.sf1.expectStaticType<Exactly<void Function()>>();
  Ext.sf2.expectStaticType<Exactly<void Function()>>();
  Ext.sf3.expectStaticType<Exactly<void Function()>>();
  Ext.sf4.expectStaticType<Exactly<void Function()>>();

  ET.sf1.expectStaticType<Exactly<void Function()>>();
  ET.sf2.expectStaticType<Exactly<void Function()>>();
  ET.sf3.expectStaticType<Exactly<void Function()>>();
  ET.sf4.expectStaticType<Exactly<void Function()>>();
}
