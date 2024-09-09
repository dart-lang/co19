// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` refers to
///   the augmented operator method, which must be immediately invoked using
///   function call syntax. For example when augmenting `operator +` you would
///   use `augmented(1)` to call the augmented operator, and when augmenting
///   `operator []=` you would use the `augmented(key, value)` syntax.
///
/// @description Checks that `augmented(i)` and `augmented(i, v)` inside of
/// augmenting operators `[]` and `[]=` invokes an augmented operator with `i`
/// and `v` as arguments.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A05_t14_lib1.dart';
part 'augmented_expression_A05_t14_lib2.dart';

String _log = "";
var augmented = ["Top-level augmented", "should", "not", "be", "used"];

class C {
  String operator [](int index) => "C[$index]";
  void operator []=(int index, String value) {_log = "C[$index]=$value";}
  List<String> augmented = ["C.augmented", "should", "not", "be", "used"];
}

mixin M {
  String operator [](int index) => "M[$index]";
  void operator []=(int index, String value) {_log = "M[$index]=$value";}
  List<String> augmented = ["M.augmented", "should", "not", "be", "used"];
}

enum E {
  e1;
  String operator [](int index) => "E[$index]";
  void operator []=(int index, String value) {_log = "E[$index]=$value";}
  final List<String> augmented = ["E.augmented", "should", "not", "be", "used"];
}

class A {
  List<String> augmented = ["A.augmented", "should", "not", "be", "used"];
}

extension Ext on A {
  String operator [](int index) => "Ext[$index]";
  void operator []=(int index, String value) {_log = "Ext[$index]=$value";}
}

class MA = Object with M;

main() {
  Expect.equals("C: Augment2[1]", C()[1]);
  C()[2] = "a";
  Expect.equals("C: Augment2[2]=a", _log);
  Expect.equals("M: Augment2[1]", MA()[1]);
  MA()[2] = "b";
  Expect.equals("M: Augment2[2]=b", _log);
  Expect.equals("E: Augment2[1]", E.e1[1]);
  E.e1[2] = "c";
  Expect.equals("E: Augment2[2]=c", _log);
  Expect.equals("Ext: Augment2[1]", A()[1]);
  A()[2] = "d";
  Expect.equals("Ext: Augment2[2]=d", _log);
}
