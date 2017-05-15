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
 * after web-platform-tests/html/semantics/grouping-content/the-li-element/grouping-li.html
 * @assertion
 * http://www.w3.org/html/wg/drafts/html/CR/grouping-content.html#the-li-element
 * @description This test validates the li element.
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL=r'''
    <span> 
    <menu id="listmenu">
        <li>Command</li>
        <li value="3">Command</li>
    </menu>

    <menu type="toolbar" id="toolbarmenu">
        <li>
            <menu label="File">
                <button type="button">New...</button>
                <button type="button">Open...</button>
            </menu>
        </li>
        <li value="10">
            <menu label="Help">
                <li value = "2"><a href="help.html">Help Me</a></li>
                <li><a href="about.html">About</a></li>
            </menu>
        </li>
    </menu>

    <p>Unordered List</p>
    <ul id="unordered">
        <li id="test_li">list item</li>
        <li>list item</li>
        <li>list item</li>
    </ul>
    </span>

    <p>Ordered List</p>
    <ol id="basic">
        <li>list item</li>
        <li>list item</li>
        <li>list item</li>
    </ol>

    <p>Ordered List</p>
    <ol id="start2">
        <li value="2">list item</li>
        <li>list item</li>
        <li>list item</li>
    </ol>

    <p>Ordered List</p>
    <ol id="negative">
        <li value="-10">list item</li>
        <li>list item</li>
        <li>list item</li>
    </ol>

    <p>Ordered List</p>
    <ol id="posFloatDown">
        <li value="4.03">list item</li>
        <li>list item</li>
        <li>list item</li>
    </ol>

    <p>Ordered List</p>
    <ol id="negFloatDown">
        <li value="-4.03">list item</li>
        <li>list item</li>
        <li>list item</li>
    </ol>

    <p>Ordered List</p>
    <ol id="posFloatUp">
        <li value="4.9">list item</li>
        <li>list item</li>
        <li>list item</li>
    </ol>

    <p>Ordered List</p>
    <ol id="negFloatUp">
        <li value="-4.9">list item</li>
        <li>list item</li>
        <li>list item</li>
    </ol>

    <p>Ordered List</p>
    <ol id="exponent">
        <li value="7e2">list item</li>
        <li>list item</li>
        <li>list item</li>
    </ol>

    <p>Ordered List</p>
    <ol id="decimal">
        <li value=".5">list item</li>
        <li>list item</li>
        <li>list item</li>
    </ol>

    <p>Ordered List</p>
    <ol id="letter">
        <li value="A">list item</li>
        <li>list item</li>
        <li>list item</li>
    </ol>
''';

void main() {
  document.body.appendHtml(htmlEL, treeSanitizer: NodeTreeSanitizer.trusted);

//        "use strict";

        var testLI = document.getElementById("test_li"), testList = [], i = 0;

        // "The [value] attribute has no default value" so, per http://www.w3.org/html/wg/drafts/html/CR/single-page.html#reflect, 
        // the default when unspecified is 0 
        testList = document.querySelectorAll("#unordered li, #basic li");
        test(() {
            for(i = 0; i < testList.length; i++) {
                assert_equals(testList[i].value, 0, "Default (unspecified) value of value is 0.");
            }
        }, "Default (unspecified) value of value is 0.");

        // "If the value attribute is present, user agents must parse it as an integer, in order to determine the attribute's value. 
        //  If the attribute's value cannot be converted to a number, the attribute must be treated as if it was absent." 
        // Per http://www.w3.org/html/wg/drafts/html/CR/single-page.html#collect-a-sequence-of-characters, 
        //    an integer is parsed by collecting as many digits as possible and then aborting at the first 
        //    non-digit character after the first digit (otherwise, with no beginning digit, it's just an error)
        // and:  "The value IDL attribute must reflect the value of the value content attribute."

        // start2's first element has value of 2
        test(() {
            testLI = document.getElementById("start2").children[0];
            assert_equals(testLI.value, 2, "value of 2 -> value of 2");
        }, ".value property reflects content attribute - and both parse value of '2' correctly.");
		
        // negative's first element has value of -10
        test(() {
            testLI = document.getElementById("negative").children[0];
            assert_equals(testLI.value, -10, "value of -10 -> value of -10");
        }, "IDL and content attribute parse value of '-10' correctly.");
	
        // posFloatDown's first element has value of 4.03 which should return 4
        test(() {
            testLI = document.getElementById("posFloatDown").children[0];
            assert_equals(testLI.value, 4, "value of 4.03 -> 4");
        }, "IDL and content attribute parse value of '4.03' correctly.");

        // negFloatDown's first element has value of -4.03 which should return -4
        test(() {
            testLI = document.getElementById("negFloatDown").children[0];
            assert_equals(testLI.value, -4, "value of -4.03 -> -4");
        }, "IDL and content attribute parse value of '-4.03' correctly.");

        // posFloatUp's first element has value of 4.9 which should return 4
        test(() {
            testLI = document.getElementById("posFloatUp").children[0];
            assert_equals(testLI.value, 4, "value of 4.9 -> 4");
        }, "IDL and content attribute parse value of '4.9' correctly.");

        // negFloatUp's first element has value of -4.9 which should return -4
        test(() {
            testLI = document.getElementById("negFloatUp").children[0];
            assert_equals(testLI.value, -4, "value of -4.9 -> -4");
        }, "IDL and content attribute parse value of '-4.9' correctly.");

        // exponent's first element has value of 7e2 which should return 7
        test(() {
            testLI = document.getElementById("exponent").children[0];
            assert_equals(testLI.value, 7, "value of 7e2 -> 7");
        }, "IDL and content attribute parse value of '7e2' correctly.");

        // decimal's first element has value of .5 which should return 0
        test(() {
            testLI = document.getElementById("decimal").children[0];
            assert_equals(testLI.value, 0, "value of .5 -> 0 (default)");
        }, "IDL and content attribute parse value of '.5' correctly.");

        // letter's first element has value of A which should return 0
        test(() {
            testLI = document.getElementById("letter").children[0];
            assert_equals(testLI.value, 0, "value of A -> 0 (default)");
        }, "IDL and content attribute parse value of 'A' correctly.");

  checkTestFailures();
}
