// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Map: A type schema Map<K, V> where:
/// i. If p has type arguments then K, and V are those type arguments.
/// ii.  Else if p has no entries, then K and V are _.
/// iii. Else K is _ and V is the greatest lower bound of the context type
///     schemas of all value subpatterns.
///
/// @description Check that if map pattern p has type arguments then K, and V
/// are those type arguments.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

class A {}
class B extends A {}
class C extends B {}
class D extends C {}

main() {
  A a = A();
  B b = B();
  C c = C();
  D d = D();

  String log = "";
  try {
    var <String, B>{"key1": A v1, "key2": B v2, "key3": v3} =
        getType({}, (String s) {log += s;});
  } catch (_) {}
  Expect.equals(typeOf<Map<String, B>>().toString(), log);

  log = "";
  try {
    final <String, C>{"key1": v1, "key2": v2, "key3": v3} =
        getType({}, (String s) {log += s;});
  } catch (_) {}
  Expect.equals(typeOf<Map<String, C>>().toString(), log);

  log = "";
  var <String, C>{} = getType(<String, C>{}, (String s) {log += s;});
  Expect.equals(typeOf<Map<String, C>>().toString(), log);

  log = "";
  final <int, B>{} = getType(<int, B>{}, (String s) {log += s;});
  Expect.equals(typeOf<Map<int, B>>().toString(), log);
}
