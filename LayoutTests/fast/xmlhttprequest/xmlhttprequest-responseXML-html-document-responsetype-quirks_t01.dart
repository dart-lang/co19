/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests the  responseXml loading an HTML
 * document in Quirks Mode with responseType "document".
 */
import "dart:html";
import "../../testcommon.dart";

const String htmlEL = r'''
    <div id="description"></div>

    <!-- Leave these break tags malformed/open to test HTML parsing.
         They should be siblings to div#description, and not nested within one another.
         The XMLDocument parser would treat the second <br> as a child to the first. -->
    <br><br>
    <div id="console"></div>
''';

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

    var xhr = new HttpRequest(),
        url = "$testSuiteRoot/fast/xmlhttprequest/resources/xmlhttprequest-responseXML-html-document-responsetype.html",
        children;
        
    xhr.onLoad.listen((e) {
        Expect.isNotNull(xhr.responseXml);
        Expect.isTrue(xhr.responseXml is Document);

        //'The two open &lt;br&gt; elements should be siblings of one another and not nested per HTML parser spec.;

        // Get the children of the body tag, using QSA to skip all text nodes.
        children = xhr.responseXml.querySelectorAll('body > *');

        // Test that the HTML parser was used by confirming the two BR tags are adjacent siblings
        // and not nested within one another, nor nesting the div#console node.
        // There should be 5 non-text children altogether.
   //     Expect.equals(5, children.length);
        Expect.equals('DIV', children[0].tagName, "children[0].tagName");
        Expect.equals('description', children[0].id, 'description');
        Expect.equals('BR', children[1].tagName, "children[1].tagName");
        Expect.equals('BR', children[2].tagName, "children[2].tagName");
        Expect.equals('DIV', children[3].tagName, "children[3].tagName");
        Expect.equals('console', children[3].id, "children[3].id");
        Expect.equals('SCRIPT', children[4].tagName, "children[4].tagName");

        // Make sure the first BR tag doesn't have an "id" set, which will prove
        // the first script in this document was not executed.
        Expect.notEquals("break-tag", children[1].id, "children[1].id");

        // The parsed HTML document in responseXml should be the same compatMode as this document.
        // This document is in quirks mode due to a missing DOCTYPE.
        /* TODO find Dart's equivalent to document.compatMode
        Expect.equals(xhr.responseXml.compatMode, 'BackCompat');
        Expect.equals(xhr.responseXml.compatMode, document.compatMode);
        */
        asyncEnd();
    });
    xhr.onError.listen( (e) {
        asyncEnd();
        Expect.fail('The XHR request to an existing resource failed: $url');
    });

    asyncStart();
    xhr.open('GET', url);
    xhr.responseType = 'document';
    xhr.send(null);
    //////
    // This code will manipulate the first BR node by adding an "id" to it.
    // This same BR will be inspected after XHR loads the document to see
    // if this script executed or not.  If it didn't execute, the first BR
    // will not have an "id" specified and the test passes.
    var br = document.querySelector('div#description + br');
    br.id = 'break-tag';
}