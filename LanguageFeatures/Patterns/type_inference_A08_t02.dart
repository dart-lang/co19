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
/// @description Check that if map pattern p has no entries, then K and V are _.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  String log = "";
  var {} = getType({}, (String s) {log += s;});
  Expect.equals(typeOf<Map<dynamic, dynamic>>().toString(), log);

  log = "";
  final {} = getType({}, (String s) {log += s;});
  Expect.equals(typeOf<Map<dynamic, dynamic>>().toString(), log);
}
