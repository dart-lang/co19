/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that URIs used in styles that are set via innerHTML are
 * resolved against the current document's base URI.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('<div id="container"></div>',
      treeSanitizer: new NullTreeSanitizer());

  document.getElementById('container').setInnerHtml(
      '<span id="test-span" style="background-image:url(\'IntentionallyMissingFile.png\')"></span>',
      treeSanitizer: new NullTreeSanitizer());
  
  var cssUriWasResolvedAgainstDocumentUri = document.getElementById("test-span")
    .style.backgroundImage == 'url("IntentionallyMissingFile.png")';

  Expect.isTrue(cssUriWasResolvedAgainstDocumentUri);
}
