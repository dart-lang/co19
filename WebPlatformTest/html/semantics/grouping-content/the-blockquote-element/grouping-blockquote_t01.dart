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
/**
 * after web-platform-tests/html/semantics/grouping-content/the-blockquote-element/grouping-blockquote.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/CR/grouping-content.html#the-blockquote-element
 * @description the blockquote element
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL=r'''
    <blockquote>0- Cite is not provided.</blockquote>
    <blockquote cite="blehblah">1- Cite = "blehblah" </blockquote>
    <blockquote cite="http://w3c-test.org/">2- Cite = "http://w3c-test.org/"</blockquote>
    <blockquote cite="http://www2.w3c-test.org/">3- Cite = "http://www2.w3c-test.org/"</blockquote>
    <blockquote cite="http://天気の良い日.w3c-test.org/">4- Cite = "http://天気の良い日.w3c-test.org/"</blockquote>
    <blockquote cite="http://élève.w3c-test.org/">5- Cite = "http://élève.w3c-test.org/"</blockquote>
    <blockquote cite="https://www.w3c-test.org/">6- Cite = "https://www.w3c-test.org/"</blockquote>
    <blockquote cite=" http://w3c-test.org/ ">7- Cite = "http://w3c-test.org/" w/ spaces </blockquote>
    <blockquote cite="  http://w3c-test.org/    ">8- Cite = "http://w3c-test.org/" w/ tabs </blockquote>
    <blockquote cite="&#x20http://w3c-test.org/&#x20">9- Cite = "http://w3c-test.org/" w/ Unicode space </blockquote>
    <blockquote cite="&#x09http://w3c-test.org/&#x09">10- Cite = "http://w3c-test.org/" w/ Unicode tab</blockquote>
    <blockquote cite="&#x0Ahttp://w3c-test.org/&#x0A">11- Cite = "http://w3c-test.org/" w/ Unicode newline</blockquote>
    <blockquote cite="&#x0Chttp://w3c-test.org/&#x0C">12- Cite = "http://w3c-test.org/" w/ Unicode formfeed</blockquote>
    <blockquote cite="&#x0Dhttp://w3c-test.org/&#x0D">13- Cite = "http://w3c-test.org/" w/ Unicode carriage return </blockquote>
    <blockquote cite="  &#x20&#x09&#x0A http://w3c-test.org/  &#x0C     &#x0D   ">14- Cite = "http://w3c-test.org/" w/ combo spaces </blockquote>
''';

const String actual='actual';
const String resolved='resolved';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);
//        "use strict";
        var location=window.location;
        
        var testURLs = [
                {actual: "", resolved: ""}, 
                {actual: "blehblah", resolved: "${location.protocol}//${location.host}/blehblah"}, 
                {actual: "http://w3c-test.org/", resolved: "http://w3c-test.org/"},
                {actual: "http://www2.w3c-test.org/", resolved: "http://www2.w3c-test.org/"},
                {actual: "http://天気の良い日.w3c-test.org/", resolved: "http://天気の良い日.w3c-test.org/"}, 
                {actual: "http://élève.w3c-test.org/", resolved: "http://élève.w3c-test.org/"},
                {actual: "https://www.w3c-test.org/", resolved: "https://www.w3c-test.org/"},
                {actual: " http://w3c-test.org/ ", resolved: "http://w3c-test.org/"}, // with spaces
                {actual: "	http://w3c-test.org/	", resolved: "http://w3c-test.org/"}, // with tabs
                {actual: "\u0020http://w3c-test.org/\u0020", resolved: "http://w3c-test.org/"}, // with unicode space 
                {actual: "\u0009http://w3c-test.org/\u0009", resolved: "http://w3c-test.org/"}, // with unicode tab
                {actual: "\u000Ahttp://w3c-test.org/\u000A", resolved: "http://w3c-test.org/"}, // with unicode newline
                {actual: "\u000Chttp://w3c-test.org/\u000C", resolved: "http://w3c-test.org/"}, // with unicode formfeed
                {actual: "\u000Dhttp://w3c-test.org/\u000D", resolved: "http://w3c-test.org/"}, // with unicode carriage return
                {actual: "  \u0020\u0009\u000A http://w3c-test.org/  \u000C 	\u000D   ", resolved: "http://w3c-test.org/"} // with combo unicode spaces
                ];

        var testElement = {}, testQuotes = [];

        void setup() {
            testQuotes = document.getElementsByTagName("blockquote");
            testElement = testQuotes[0];
        }
        
        setup();

        // If the content attribute is absent, the IDL attribute must return the default value, if the content attribute has one, or else the empty string.
        test(() {
            assert_equals(testElement.cite, "", "If the cite content attribute is absent, the IDL attribute must return the empty string.");
        }, "If the cite content attribute is absent, the IDL attribute must return the empty string.");	

        // On setting, the IDL attribute must set the content attribute to the specified literal value.
        test(() {
            testElement.cite = "foo bar";	
            assert_equals(testElement.attributes["cite"], "foo bar", "Setting cite IDL sets content attribute to specified literal value.");
        }, "Setting cite IDL sets content attribute to specified literal value.");		

        // All other testQuote examples have content attributes to test vis-a-vis registering and resolving

        setup();

        for (var i = 1; i < testQuotes.length; i++) {
            // Check that element's cite content attribute registered properly (literally, not resolved)
            test(() {	
                assert_equals(testQuotes[i].attributes["cite"], testURLs[i][actual], "blockquote #$i: content attribute");
            }, "blockquote #${i}: cite content attribute registers markup.");
        }

        for (var i = 1; i < testQuotes.length; i++) {
            // The cite IDL attribute must reflect the element's cite content attribute (resolving URLs relative to the element)...
            test(() {	
                assert_equals(testQuotes[i].cite, testURLs[i][resolved], "blockquote #$i: cite IDL reflects content attribute.");
            }, "blockquote #${i}: cite IDL reflects content attribute.");
        }

  checkTestFailures();
}


