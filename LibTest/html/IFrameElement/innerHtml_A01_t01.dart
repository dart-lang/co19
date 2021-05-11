// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String innerHtml
/// Parses the HTML fragment and sets it as the contents of this element.
/// @description Checks that for iframe html set by innerHtml is set as text
/// @issue #17456
/// @issue 43331

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  IFrameElement iframe =
      new Element.html('<iframe>Content</iframe>') as IFrameElement;
  document.body?.append(iframe);
  iframe.innerHtml = '<button>foo</button>';
  var firstChild = iframe.firstChild;
  Expect.isTrue(firstChild is CharacterData);
}
