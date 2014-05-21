/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = new DomParser()
    .parseFromString('''
<!-- this comment should not become the documentElement,
     if it does then the page will be blank -->
<html>
<body>
</body>
</html>''', 'text/html');

  shouldBe(doc.documentElement.nodeType, Node.ELEMENT_NODE);
}
