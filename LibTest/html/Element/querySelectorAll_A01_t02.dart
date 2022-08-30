// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion ElementList querySelectorAll(String selectors)
/// Finds all descendant elements of this element that match the specified
/// group of selectors.
///
/// selectors should be a string using CSS selector syntax.
/// @description Checks boolean selector

import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL = r'''
<input type=checkbox id=checkbox1 checked>
<input type=radio id=radio1 checked>
<form>
  <input type=checkbox id=checkbox2 checked>
  <input type=radio id=radio2 checked>
</form>
''';

void main() {
  document.body?.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
  List checked = document.querySelectorAll(":checked");
  checked.forEach((var elem) {
    print("${elem.id}");
  });
  Expect.equals(4, checked.length);
}
