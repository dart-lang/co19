// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The actual returned type of a function literal with a block body
/// is computed as follows. Let `T` be `Never` if every control path through the
/// block exits the block without reaching the end of the block, as computed by
/// the definite completion analysis specified elsewhere. Let `T` be `Null` if
/// any control path reaches the end of the block without exiting the block, as
/// computed by the definite completion analysis specified elsewhere. Let `K` be
/// the typing context for the function body as computed above from the imposed
/// return type schema.
/// - For each `return e;` statement in the block, let `S` be the inferred type
///   of `e`, using the local type inference algorithm described below with
///   typing context `K`, and update `T` to be `UP(flatten(S), T)` if the
///   enclosing function is `async`, or `UP(S, T)` otherwise.
/// ...
/// The actual returned type of the function literal is the value of `T` after
/// all `return` and `yield` statements in the block body have been considered.
///
/// @description Check that the actual returned type of a function literal is
/// the value of `T` after all `return` statements in the block body have been
/// considered. Test an async function literal.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

var f1 = () async {
  if (1 > 2) {
    return 0;
  }
  return 3.14;
};
var f2 = () async {
  if (1 > 2) {
    return 0;
  }
  if (1 > 2) {
    return 3.14;
  }
  return null;
};
var f3 = () async {
  if (1 > 2) {
    return 0;
  }
  if (1 > 2) {
    return 3.14;
  }
  return 'x';
};
var f4 = () async {
  if (1 > 2) {
    return 0;
  }
  if (1 > 2) {
    return 3.14;
  }
  return Future.value(null);
};
var f5 = () async {
  if (1 > 2) {
    return 0;
  }
  if (1 > 2) {
    return 3.14;
  }
  return <num>[42];
};

class C {
  static var sf1 = () async {
    if (1 > 2) {
      return 0;
    }
    return 3.14;
  };
  static var sf2 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return null;
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return 'x';
  };
  static var sf4 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return Future.value(null);
  };
  static var sf5 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return <num>[42];
  };

  var f1 = () async {
    if (1 > 2) {
      return 0;
    }
    return 3.14;
  };
  var f2 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return null;
  };
  var f3 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return 'x';
  };
  var f4 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return Future.value(null);
  };
  var f5 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return <num>[42];
  };
}

mixin M {
  static var sf1 = () async {
    if (1 > 2) {
      return 0;
    }
    return 3.14;
  };
  static var sf2 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return null;
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return 'x';
  };
  static var sf4 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return Future.value(null);
  };
  static var sf5 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return <num>[42];
  };

  var f1 = () async {
    if (1 > 2) {
      return 0;
    }
    return 3.14;
  };
  var f2 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return null;
  };
  var f3 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return 'x';
  };
  var f4 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return Future.value(null);
  };
  var f5 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return <num>[42];
  };
}

mixin class MC {
  static var sf1 = () async {
    if (1 > 2) {
      return 0;
    }
    return 3.14;
  };
  static var sf2 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return null;
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return 'x';
  };
  static var sf4 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return Future.value(null);
  };
  static var sf5 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return <num>[42];
  };

  var f1 = () async {
    if (1 > 2) {
      return 0;
    }
    return 3.14;
  };
  var f2 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return null;
  };
  var f3 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return 'x';
  };
  var f4 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return Future.value(null);
  };
  var f5 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return <num>[42];
  };
}

enum E {
  e0;

  static var sf1 = () async {
    if (1 > 2) {
      return 0;
    }
    return 3.14;
  };
  static var sf2 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return null;
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return 'x';
  };
  static var sf4 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return Future.value(null);
  };
  static var sf5 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return <num>[42];
  };
}

class A {}

extension Ext on A {
  static var sf1 = () async {
    if (1 > 2) {
      return 0;
    }
    return 3.14;
  };
  static var sf2 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return null;
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return 'x';
  };
  static var sf4 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return Future.value(null);
  };
  static var sf5 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return <num>[42];
  };
}

extension type ET(int _) {
  static var sf1 = () async {
    if (1 > 2) {
      return 0;
    }
    return 3.14;
  };
  static var sf2 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return null;
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return 'x';
  };
  static var sf4 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return Future.value(null);
  };
  static var sf5 = () async {
    if (1 > 2) {
      return 0;
    }
    if (1 > 2) {
      return 3.14;
    }
    return <num>[42];
  };
}

class MA = Object with M;

main() {
  f1.expectStaticType<Exactly<Future<num> Function()>>();
  f2.expectStaticType<Exactly<Future<num?> Function()>>();
  f3.expectStaticType<Exactly<Future<Object> Function()>>();
  f4.expectStaticType<Exactly<Future<num?> Function()>>();
  f5.expectStaticType<Exactly<Future<Object> Function()>>();

  C.sf1.expectStaticType<Exactly<Future<num> Function()>>();
  C.sf2.expectStaticType<Exactly<Future<num?> Function()>>();
  C.sf3.expectStaticType<Exactly<Future<Object> Function()>>();
  C.sf4.expectStaticType<Exactly<Future<num?> Function()>>();
  C.sf5.expectStaticType<Exactly<Future<Object> Function()>>();
  C().f1.expectStaticType<Exactly<Future<num> Function()>>();
  C().f2.expectStaticType<Exactly<Future<num?> Function()>>();
  C().f3.expectStaticType<Exactly<Future<Object> Function()>>();
  C().f4.expectStaticType<Exactly<Future<num?> Function()>>();
  C().f5.expectStaticType<Exactly<Future<Object> Function()>>();

  M.sf1.expectStaticType<Exactly<Future<num> Function()>>();
  M.sf2.expectStaticType<Exactly<Future<num?> Function()>>();
  M.sf3.expectStaticType<Exactly<Future<Object> Function()>>();
  M.sf4.expectStaticType<Exactly<Future<num?> Function()>>();
  M.sf5.expectStaticType<Exactly<Future<Object> Function()>>();
  MA().f1.expectStaticType<Exactly<Future<num> Function()>>();
  MA().f2.expectStaticType<Exactly<Future<num?> Function()>>();
  MA().f3.expectStaticType<Exactly<Future<Object> Function()>>();
  MA().f4.expectStaticType<Exactly<Future<num?> Function()>>();
  MA().f5.expectStaticType<Exactly<Future<Object> Function()>>();

  MC.sf1.expectStaticType<Exactly<Future<num> Function()>>();
  MC.sf2.expectStaticType<Exactly<Future<num?> Function()>>();
  MC.sf3.expectStaticType<Exactly<Future<Object> Function()>>();
  MC.sf4.expectStaticType<Exactly<Future<num?> Function()>>();
  MC.sf5.expectStaticType<Exactly<Future<Object> Function()>>();
  MC().f1.expectStaticType<Exactly<Future<num> Function()>>();
  MC().f2.expectStaticType<Exactly<Future<num?> Function()>>();
  MC().f3.expectStaticType<Exactly<Future<Object> Function()>>();
  MC().f4.expectStaticType<Exactly<Future<num?> Function()>>();
  MC().f5.expectStaticType<Exactly<Future<Object> Function()>>();

  E.sf1.expectStaticType<Exactly<Future<num> Function()>>();
  E.sf2.expectStaticType<Exactly<Future<num?> Function()>>();
  E.sf3.expectStaticType<Exactly<Future<Object> Function()>>();
  E.sf4.expectStaticType<Exactly<Future<num?> Function()>>();
  E.sf5.expectStaticType<Exactly<Future<Object> Function()>>();

  Ext.sf1.expectStaticType<Exactly<Future<num> Function()>>();
  Ext.sf2.expectStaticType<Exactly<Future<num?> Function()>>();
  Ext.sf3.expectStaticType<Exactly<Future<Object> Function()>>();
  Ext.sf4.expectStaticType<Exactly<Future<num?> Function()>>();
  Ext.sf5.expectStaticType<Exactly<Future<Object> Function()>>();

  ET.sf1.expectStaticType<Exactly<Future<num> Function()>>();
  ET.sf2.expectStaticType<Exactly<Future<num?> Function()>>();
  ET.sf3.expectStaticType<Exactly<Future<Object> Function()>>();
  ET.sf4.expectStaticType<Exactly<Future<num?> Function()>>();
  ET.sf5.expectStaticType<Exactly<Future<Object> Function()>>();
}
