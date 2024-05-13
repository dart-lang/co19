// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
///
/// @description Checks that it is not an error to have a multiple local
/// declarations named `_`. Test type parameters of functions and methods.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

String topLevelFunction<_, _, _ extends num>() => "topLevelFunction";

class C {
  static String staticMethod<_, _, _ extends num>() => "C.staticMethod";
  String instanceMethod<_, _, _ extends num>() => "C.instanceMethod";
}

mixin M {
  static String staticMethod<_, _, _ extends num>() => "M.staticMethod";
  String instanceMethod<_, _, _ extends num>() => "M.instanceMethod";
}

enum E {
  e1;
  static String staticMethod<_, _, _ extends num>() => "E.staticMethod";
  String instanceMethod<_, _, _ extends num>() => "E.instanceMethod";
}

extension type ET(int id) {
  static String staticMethod<_, _, _ extends num>() => "ET.staticMethod";
  String instanceMethod<_, _, _ extends num>() => "ET.instanceMethod";
}

class A {}

extension Ext on A {
  static String staticMethod<_, _, _ extends num>() => "Ext.staticMethod";
  String instanceMethod<_, _, _ extends num>() => "Ext.instanceMethod";
}

class MA = Object with M;

main() {
  void localFunction<_, _, _ extends num>() => "localFunction";

  var functionExpression = <_, _, _ extends num>() => "functionExpression";

  Expect.equals("topLevelFunction", topLevelFunction<int, String, int>());
  Expect.equals("localFunction", localFunction<int, String, int>());
  Expect.equals("functionExpression", functionExpression<int, String, int>());
  Expect.equals("C.staticMethod", C.staticMethod<int, String, int>());
  Expect.equals("C.instanceMethod", C().instanceMethod<int, String, int>());
  Expect.equals("M.staticMethod", M.staticMethod<int, String, int>());
  Expect.equals("M.instanceMethod", MA().instanceMethod<int, String, int>());
  Expect.equals("E.staticMethod", E.staticMethod<int, String, int>());
  Expect.equals("E.instanceMethod", E.e1.instanceMethod<int, String, int>());
  Expect.equals("ET.staticMethod", ET.staticMethod<int, String, int>());
  Expect.equals("ET.instanceMethod", ET(1).instanceMethod<int, String, int>());
  Expect.equals("Ext.staticMethod", Ext.staticMethod<int, String, int>());
  Expect.equals("Ext.instanceMethod", A().instanceMethod<int, String, int>());
}
