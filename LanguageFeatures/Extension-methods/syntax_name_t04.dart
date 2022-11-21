// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion an extension declaration is a top-level declaration with a grammar
/// similar to:
/// <extension> ::=
///   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
///     memberDeclaration*
///   `}'
/// Such a declaration introduces its name (the identifier) into the surrounding
/// scope. The name does not denote a type, but it can be used to denote the
/// extension itself in various places. The name can be hidden or shown in import
/// or export declarations.
///
/// @description Check that the name can be hidden or shown in import or export
/// declarations.
/// @author sgrekhov@unipro.ru



import "../../Utils/expect.dart";
import "my_fancy_list_lib.dart" show MyFancyList;

main() {
  List<String> list = ["Lily", "was", "here"];
  Expect.equals(6, list.doubleLength);
  Expect.listEquals([["Lily"], ["was", "here"]], list.split(1));
  Expect.listEquals(["here", "was", "Lily"], -list);
  Expect.listEquals([["was", "here"], ["Lily"]], -list.split(1));
  Expect.equals("List", MyFancyList.className);
}
