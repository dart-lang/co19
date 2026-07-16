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
/// @description Check that if actual return type is `Future<void>` and the 
/// function literal is marked `async`, then the inferred return type of the 
/// function literal is `Future<void>`.
/// @author sgrekhov22@gmail.com

void getVoid() {}
Future<void> getFutureVoid() async {}

var f1 = () async {
  return getFutureVoid();
};
var f2 = () async {
  if (1 > 2) {
    return getFutureVoid();
  }
};
var f3 = () async {
  if (1 > 2) {
    return 42 as dynamic;
  }
  return getFutureVoid();
};
var f4 = () async {
  if (1 > 2) {
    return null;
  }
  return getFutureVoid();
};
var f5 = () async {
  if (1 > 2) {
    return getVoid();
  }
  return getFutureVoid();
};
var f6 = () async {
  if (1 > 2) {
    return Future.value(null);
  }
  return getFutureVoid();
};
var f7 = () async {
  if (1 > 2) {
    return Future<dynamic>.value(42);
  }
  return getFutureVoid();
};

class C {
  static var sf1 = () async {
    return getFutureVoid();
  };
  static var sf2 = () async {
    if (1 > 2) {
      return getFutureVoid();
    }
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getFutureVoid();
  };
  static var sf4 = () async {
    if (1 > 2) {
      return null;
    }
    return getFutureVoid();
  };
  static var sf5 = () async {
    if (1 > 2) {
      return getVoid();
    }
    return getFutureVoid();
  };
  static var sf6 = () async {
    if (1 > 2) {
      return Future.value(null);
    }
    return getFutureVoid();
  };
  static var sf7 = () async {
    if (1 > 2) {
      return Future<dynamic>.value(42);
    }
    return getFutureVoid();
  };

  var f1 = () async {
    return getFutureVoid();
  };
  var f2 = () async {
    if (1 > 2) {
      return getFutureVoid();
    }
  };
  var f3 = () async {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getFutureVoid();
  };
  var f4 = () async {
    if (1 > 2) {
      return null;
    }
    return getFutureVoid();
  };
  var f5 = () async {
    if (1 > 2) {
      return getVoid();
    }
    return getFutureVoid();
  };
  var f6 = () async {
    if (1 > 2) {
      return Future.value(null);
    }
    return getFutureVoid();
  };
  var f7 = () async {
    if (1 > 2) {
      return Future<dynamic>.value(42);
    }
    return getFutureVoid();
  };
}

mixin M {
  static var sf1 = () async {
    return getFutureVoid();
  };
  static var sf2 = () async {
    if (1 > 2) {
      return getFutureVoid();
    }
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getFutureVoid();
  };
  static var sf4 = () async {
    if (1 > 2) {
      return null;
    }
    return getFutureVoid();
  };
  static var sf5 = () async {
    if (1 > 2) {
      return getVoid();
    }
    return getFutureVoid();
  };
  static var sf6 = () async {
    if (1 > 2) {
      return Future.value(null);
    }
    return getFutureVoid();
  };
  static var sf7 = () async {
    if (1 > 2) {
      return Future<dynamic>.value(42);
    }
    return getFutureVoid();
  };

  var f1 = () async {
    return getFutureVoid();
  };
  var f2 = () async {
    if (1 > 2) {
      return getFutureVoid();
    }
  };
  var f3 = () async {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getFutureVoid();
  };
  var f4 = () async {
    if (1 > 2) {
      return null;
    }
    return getFutureVoid();
  };
  var f5 = () async {
    if (1 > 2) {
      return getVoid();
    }
    return getFutureVoid();
  };
  var f6 = () async {
    if (1 > 2) {
      return Future.value(null);
    }
    return getFutureVoid();
  };
  var f7 = () async {
    if (1 > 2) {
      return Future<dynamic>.value(42);
    }
    return getFutureVoid();
  };
}

mixin class MC {
  static var sf1 = () async {
    return getFutureVoid();
  };
  static var sf2 = () async {
    if (1 > 2) {
      return getFutureVoid();
    }
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getFutureVoid();
  };
  static var sf4 = () async {
    if (1 > 2) {
      return null;
    }
    return getFutureVoid();
  };
  static var sf5 = () async {
    if (1 > 2) {
      return getVoid();
    }
    return getFutureVoid();
  };
  static var sf6 = () async {
    if (1 > 2) {
      return Future.value(null);
    }
    return getFutureVoid();
  };
  static var sf7 = () async {
    if (1 > 2) {
      return Future<dynamic>.value(42);
    }
    return getFutureVoid();
  };

  var f1 = () async {
    return getFutureVoid();
  };
  var f2 = () async {
    if (1 > 2) {
      return getFutureVoid();
    }
  };
  var f3 = () async {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getFutureVoid();
  };
  var f4 = () async {
    if (1 > 2) {
      return null;
    }
    return getFutureVoid();
  };
  var f5 = () async {
    if (1 > 2) {
      return getVoid();
    }
    return getFutureVoid();
  };
  var f6 = () async {
    if (1 > 2) {
      return Future.value(null);
    }
    return getFutureVoid();
  };
  var f7 = () async {
    if (1 > 2) {
      return Future<dynamic>.value(42);
    }
    return getFutureVoid();
  };
}

enum E {
  e0;

  static var sf1 = () async {
    return getFutureVoid();
  };
  static var sf2 = () async {
    if (1 > 2) {
      return getFutureVoid();
    }
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getFutureVoid();
  };
  static var sf4 = () async {
    if (1 > 2) {
      return null;
    }
    return getFutureVoid();
  };
  static var sf5 = () async {
    if (1 > 2) {
      return getVoid();
    }
    return getFutureVoid();
  };
  static var sf6 = () async {
    if (1 > 2) {
      return Future.value(null);
    }
    return getFutureVoid();
  };
  static var sf7 = () async {
    if (1 > 2) {
      return Future<dynamic>.value(42);
    }
    return getFutureVoid();
  };
}

class A {}

extension Ext on A {
  static var sf1 = () async {
    return getFutureVoid();
  };
  static var sf2 = () async {
    if (1 > 2) {
      return getFutureVoid();
    }
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getFutureVoid();
  };
  static var sf4 = () async {
    if (1 > 2) {
      return null;
    }
    return getFutureVoid();
  };
  static var sf5 = () async {
    if (1 > 2) {
      return getVoid();
    }
    return getFutureVoid();
  };
  static var sf6 = () async {
    if (1 > 2) {
      return Future.value(null);
    }
    return getFutureVoid();
  };
  static var sf7 = () async {
    if (1 > 2) {
      return Future<dynamic>.value(42);
    }
    return getFutureVoid();
  };
}

extension type ET(int _) {
  static var sf1 = () async {
    return getFutureVoid();
  };
  static var sf2 = () async {
    if (1 > 2) {
      return getFutureVoid();
    }
  };
  static var sf3 = () async {
    if (1 > 2) {
      return 42 as dynamic;
    }
    return getFutureVoid();
  };
  static var sf4 = () async {
    if (1 > 2) {
      return null;
    }
    return getFutureVoid();
  };
  static var sf5 = () async {
    if (1 > 2) {
      return getVoid();
    }
    return getFutureVoid();
  };
  static var sf6 = () async {
    if (1 > 2) {
      return Future.value(null);
    }
    return getFutureVoid();
  };
  static var sf7 = () async {
    if (1 > 2) {
      return Future<dynamic>.value(42);
    }
    return getFutureVoid();
  };
}

class MA = Object with M;
