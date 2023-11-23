// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// <extension> ::=
///   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
///     memberDeclaration*
///   `}'
/// If an extension declaration is only used locally in a library, there might be
/// no need to worry about naming conflicts or overrides. In that case, then name
/// identifier can be omitted (hence the <identifier>? in the grammar above).
/// This is equivalent to giving the extension a fresh private name.
///
/// @description Check that the extension name can be ommitted
/// @author sgrekhov@unipro.ru



import "my_fancy_list_lib.dart";

main() {
  List<String> list = ["Lily", "was", "here"];
  list.nnDoubleLength;
//     ^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_GETTER
// [cfe] The getter 'nnDoubleLength' isn't defined for the class 'List<String>'.
  List.nnClassName;
//     ^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_GETTER
// [cfe] Member not found: 'nnClassName'.
}
