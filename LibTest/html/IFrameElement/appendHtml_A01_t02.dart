// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void appendHtml(String text)
/// Parses the specified text as HTML and adds the resulting node after the
/// last child of this element.
/// @description Checks that new node will be added after the
/// last child of this element.
/// @issue 43315

import "dart:html";
import "../../../Utils/expect.dart";

const myButton = "myButton";

main() {
  IFrameElement x = new IFrameElement();
  x.appendHtml('<span><div></div><button class="$myButton"></button></span>',
      treeSanitizer: NodeTreeSanitizer.trusted);
  dynamic ch = x.lastChild;
  Expect.isTrue(ch is CharacterData);
}
