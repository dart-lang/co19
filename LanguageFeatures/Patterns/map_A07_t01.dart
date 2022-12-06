// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// mapPattern        ::= typeArguments? '{' mapPatternEntries? '}'
/// mapPatternEntries ::= mapPatternEntry ( ',' mapPatternEntry )* ','?
/// mapPatternEntry   ::= expression ':' pattern | '...'
/// ...
/// Like lists, map patterns can also have a rest pattern. However, there's no
/// well-defined notion of a map "minus" some set of matched entries. Thus, the
/// rest pattern doesn't allow a subpattern to capture the "remaining" entries.
///
/// Also, there is no ordering to entries in a map, so we only allow the ... to
/// appear as the last element. Appearing anywhere else would send a confusing,
/// meaningless signal.
///
/// In practice, this means that the only purpose of ... in a map pattern is to
/// allow matching a map that contains extra entries, while ignoring those
/// entries. By default, a map pattern only matches if the map's length is
/// exactly the same as the number of entry subpatterns. Adding a ... element
/// allows the map pattern to match if the map's length is at least the number
/// of (non-rest) entry subpatterns (and all of those subpatterns match).
///
/// @description Check that if rest pattern is present then map, that has more
/// elements than number of subpatterns in a map pattern, may match
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

String test1(Map map) {
  return switch (map) {
    case {1: 1, 2: > 0, ...} => "case-1";
    case {1: 2, 2: <= 0, ...} => "case-2";
    case {1: 3, 2: var a, ...} => "case-3";
    default => "default";
  };
}

String test2(Map map) {
  switch (map) {
    case {1: 1, 2: > 0, ...}:
      return "case-1";
    case {1: 2, 2: <= 0, ...}:
      return "case-2";
    case {1: 3, 2: var a, ...}:
      return "case-3";
    default:
      return "default";
  }
}

String test3(Map map) {
  if (map case {1: 1, 2: > 0, ...}) {
    return "case-1";
  }
  if (map case {1: 2, 2: <= 0, ...}) {
    return "case-2";
  }
  if (map case {1: 3, 2: var a, ...}) {
    return "case-3";
  }
  return "default";
}

main() {
  var {1: a, 2: b, ...} = {1: 1, 2: 2, 3: 3};
  Expect.equals(1, a);
  Expect.equals(2, b);

  final {1: 2, 2: int c, ...} = {1: 2, 2: 2, 3: 3};
  Expect.equals(3, c);

  var {1: 3, 2: _, ...} = {1: 3, 2: 2, 3: 3};

  Expect.equals("case-1", test1({1: 1, 2: 1}));
  Expect.equals("case-1", test1({1: 1, 2: 2, 3: 3}));
  Expect.equals("default", test1({1: 1}));
  Expect.equals("case-2", test1({1: 2, 2: 0}));
  Expect.equals("case-2", test1({1: 2, 2: -1, 3: 3}));
  Expect.equals("default", test1({2: 0}));
  Expect.equals("case-3", test1({1: 3, 2: 0}));
  Expect.equals("case-3", test1({1: 3, 2: -1, 3: 3}));
  Expect.equals("default", test1({1: 3}));

  Expect.equals("case-1", test2({1: 1, 2: 1}));
  Expect.equals("case-1", test2({1: 1, 2: 2, 3: 3}));
  Expect.equals("default", test2({1: 1}));
  Expect.equals("case-2", test2({1: 2, 2: 0}));
  Expect.equals("case-2", test2({1: 2, 2: -1, 3: 3}));
  Expect.equals("default", test2({2: 0}));
  Expect.equals("case-3", test2({1: 3, 2: 0}));
  Expect.equals("case-3", test2({1: 3, 2: -1, 3: 3}));
  Expect.equals("default", test2({1: 3}));

  Expect.equals("case-1", test3({1: 1, 2: 1}));
  Expect.equals("case-1", test3({1: 1, 2: 2, 3: 3}));
  Expect.equals("default", test3({1: 1}));
  Expect.equals("case-2", test3({1: 2, 2: 0}));
  Expect.equals("case-2", test3({1: 2, 2: -1, 3: 3}));
  Expect.equals("default", test3({2: 0}));
  Expect.equals("case-3", test3({1: 3, 2: 0}));
  Expect.equals("case-3", test3({1: 3, 2: -1, 3: 3}));
  Expect.equals("default", test3({1: 3}));
}
