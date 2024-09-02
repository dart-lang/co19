// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The unit of ownership is the library. It’s quite possible for one
/// part file to introduce a conflict with another part file. It always was, but
/// there are new ways too. If that happens, the library owner, who most likely
/// introduced the problem, is expected to fix it. There is no attempt to hide
/// name conflicts between declarations in separate tree-branches of the library
/// structure.
///
/// @description Check that it is a compile-time error if different part files
/// have non-augmenting declarations with the same name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part 'ownership_A01_t01_part1.dart';

String variable = "variable main";
String get getter => "getter main";
String function() => "function main";

class C {}
mixin M {}
class A {}
extension Ext on A {}
extension type ET(int _) {}

main() {
  print(variable);
  print(getter);
  print(function);
  print(C);
  print(M);
  print(A);
  print(ET);
}
