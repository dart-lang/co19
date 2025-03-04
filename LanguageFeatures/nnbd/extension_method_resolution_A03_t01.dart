// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the purposes of extension method resolution, there is no
/// special treatment of nullable types with respect to what members are
/// considered accessible. That is, the only members of a nullable type that are
/// considered accessible (and hence which take precedence over extensions) are
/// the members on Object.
///
/// @description Check that instance members have no precedence over extension
/// members of nullable type (if they are not members of Object)
/// @author sgrekhov@unipro.ru
/// @issue 41349

import "../../Utils/expect.dart";

class C {
  String m = "";
  String get getter => "C getter";
  void set setter(String v) {
    m = v;
  }

  String method(int i) => "$i";
  void operator []=(int index, String value) {
    m = "[$index]=$value";
  }
}

extension on C? {
  String get getter => "Extension getter";
  String get m => "m getter";
  void set setter(String v) {}
  void set m(String v) {}
  String method(int i) => "Extension: $i";
  void operator []=(int index, String value) {}
}

main() {
  var c = new C() as C?;
  Expect.equals("Extension getter", c.getter);
  c.m = "Lily was here";
  Expect.equals("m getter", c.m);
  c.setter = "Run, Forrest, run";
  Expect.equals("m getter", c.m);
  Expect.equals("Extension: 42", c.method(42));
  c[42] = "xxx";
  Expect.equals("m getter", c.m);
}
