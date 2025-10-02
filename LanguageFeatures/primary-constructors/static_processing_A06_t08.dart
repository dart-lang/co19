// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declaring parameter list of the declaring header constructor
/// introduces a new scope, the primary initializer scope, whose enclosing scope
/// is the body scope of `D`. Every primary parameter is entered into this scope.
///
/// The same parameter list also introduces the primary parameter scope, whose
/// enclosing scope is also the body scope of the class. Every primary parameter
/// which is not declaring, not initializing, and not a super parameter is
/// entered into this scope.
///
/// The primary initializer scope is the current scope for the initializing
/// expression, if any, of each non-late instance variable declaration. It is
/// also the current scope for the initializer list in the body part of the
/// declaring header constructor, if any.
///
/// The primary parameter scope is the current scope for the body of the body
/// part of the declaring header constructor, if any.
///
/// @description Check that the primary initializer scope is not the current
/// scope for a body of an instance method/getter/setter.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

final String x = "top level";

class C1(var String x) {
  String _setter = "";
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    _setter = x;
  }
}

class C2([String var x = "default"]) {
  String _setter = x;
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    _setter = x;
  }
}

class C3({final var String x = "default"}) {
  String _setter = "";
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    instance = x;
  }
}

class C4({required var String x}) {
  String _setter = x;
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    instance = x;
  }
}

main() {
  var c1 = C1("parameter");
  Expect.equals("parameter", c1.method());
  Expect.equals("parameter", c1.getter);
  c1.setter = "updated";
  Expect.equals("parameter", c1._setter);
  c1.x = "updated";
  Expect.equals("parameter", c1._setter);
  Expect.equals("updated", c1.method());
  Expect.equals("updated", c1.getter);
  c1.setter = "";
  Expect.equals("updated", c1._setter);

  var c2 = C2("parameter");
  Expect.equals("parameter", c2.method());
  Expect.equals("parameter", c2.getter);
  c2.setter = "updated";
  Expect.equals("parameter", c2._setter);
  c2.x = "updated";
  Expect.equals("parameter", c2._setter);
  Expect.equals("updated", c2.method());
  Expect.equals("updated", c2.getter);
  c2.setter = "";
  Expect.equals("updated", c2._setter);

  c2 = C2();
  Expect.equals("default", c2.method());
  Expect.equals("default", c2.getter);
  c2.setter = "updated";
  Expect.equals("default", c2._setter);
  c2.x = "updated";
  Expect.equals("default", c2._setter);
  Expect.equals("updated", c2.method());
  Expect.equals("updated", c2.getter);
  c2.setter = "";
  Expect.equals("updated", c2._setter);

  var c3 = C3(x: "parameter");
  Expect.equals("parameter", c3.method());
  Expect.equals("parameter", c3.getter);
  c3.setter = "updated";
  Expect.equals("parameter", c3._setter);
  c3.x = "updated";
  Expect.equals("parameter", c3._setter);
  Expect.equals("updated", c3.method());
  Expect.equals("updated", c3.getter);
  c3.setter = "";
  Expect.equals("updated", c3._setter);

  c3 = C3();
  Expect.equals("default", c3.method());
  Expect.equals("default", c3.getter);
  c3.setter = "updated";
  Expect.equals("default", c3._setter);
  c3.x = "updated";
  Expect.equals("default", c3._setter);
  Expect.equals("updated", c3.method());
  Expect.equals("updated", c3.getter);
  c3.setter = "";
  Expect.equals("updated", c3._setter);

  var c4 = C4(x: "parameter");
  Expect.equals("default", c4.method());
  Expect.equals("default", c4.getter);
  c4.setter = "updated";
  Expect.equals("default", c4._setter);
  c4.x = "updated";
  Expect.equals("default", c4._setter);
  Expect.equals("updated", c4.method());
  Expect.equals("updated", c4.getter);
  c4.setter = "";
  Expect.equals("updated", c4._setter);
}
