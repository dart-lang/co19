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
