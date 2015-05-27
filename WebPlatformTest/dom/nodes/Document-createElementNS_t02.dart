/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/*
 * after web-platform-tests/dom/nodes/Document-createElementNS.html
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-createelementns">
 *
 * @assertion Document.createElementNS()
 * 7. If qualifiedName or prefix is "xmlns" and namespace is not the XMLNS namespace,
 * throw a "NamespaceError" exception and terminate these steps.
 *
 * @description
 * @needsreview dart issue #18236
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
    assert_throws("NamespaceError", 
         () { document.createElementNS("http://oops/", "xmlns"); }
    );
}
