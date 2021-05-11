// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void setInnerHtml(String html, {NodeValidator validator,
/// NodeTreeSanitizer treeSanitizer}) 
/// Parses the HTML fragment and sets it as the contents of this element.
/// This ensures that the generated content follows the sanitization rules
/// specified by the validator or treeSanitizer.
/// The resulting tree is guaranteed to only contain nodes and attributes
/// which are allowed by the provided validator.
/// @description Checks that if validator and sanitizer are omitted,
/// unknown elements and attributes are removed from provided html.
/// @issue #17456

// OtherResources=iframe.html
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  IFrameElement x = Element.html(
      '<iframe src="iframe.html"></iframe>',
      treeSanitizer: new NullTreeSanitizer()) as IFrameElement;
  document.body?.append(x);
  x.setInnerHtml('<div foo="foo"><bar id="bar"></bar></div>');
  print(x.firstChild);
  Expect.isTrue(x.firstChild is CharacterData);

  var bar = x.querySelector('#bar');
  Expect.isNull(bar);
}
