/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="test">hello world<span style="font-weight: bold;">WebKit</span><em><script>var i=0;</script><b><code>This</code> is</u></b> a <tt>test <wbr>of <blockquote>Range's extractContents.</blockquote></tt></em><q><dfn>This</dfn></q><!-- test --> <header><h3>test</header> also works in Firefox.</h3></div>
    <div id="expectations">
        <div id="test_empty"></div>
        <div id="test_text">hello world</div>
        <div id="test_substring">llo</div>
        <div id="test_text_with_start_tag">hello world<span style="font-weight: bold;"></span></div>
        <div id="test_text_and_span">hello world<span style="font-weight: bold;">WebKit</span></div>
        <div id="test_span_b"><span style="font-weight: bold;">WebKit</span><em><script>var i=0;</script><b></b></em></div>
        <div id="test_code_blockquote"><b><code>This</code> is</u></b> a <tt>test <wbr>of <blockquote>Range's extractContents.</blockquote></tt></div>
        <div id="test_wbr_blockquote"><wbr>of <blockquote>Range's extractContents.</blockquote></div>
        <div id="test_q_header"><q><dfn>This</dfn></q><!-- test --> <header><h3>test</h3></header></div>
        <div id="test_script_dfn"><em><script>var i=0;</script><b><code>This</code> is</u></b> a <tt>test <wbr>of <blockquote>Range's extractContents.</blockquote></tt></em><q><dfn>This</dfn></div>
        <div id="test_blockquote_em"><tt><blockquote>Range's extractContents.</blockquote></tt></div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  markup(x) => x.innerHtml;

  testExtractContents(description, startContainer, startOffset, endContainer, endOffset, expectedContentsId) {
    debug(description);
    var testContents = document.getElementById('test').innerHtml;

    var range = document.createRange();
    range.setStart(startContainer, startOffset);
    range.setEnd(endContainer, endOffset);
    var actualContents = range.extractContents();

    document.getElementById('test').setInnerHtml(testContents,
        treeSanitizer: new NullTreeSanitizer());

    var expectedContents = document.getElementById(expectedContentsId);
    shouldBe(markup(actualContents), markup(expectedContents));
  }

  var test = document.getElementById('test');

  firstElement(name) {
    return test.querySelector(name);
  }

  testExtractContents('Extracting empty contents', test, 0, test, 0, 'test_empty');
  testExtractContents('Extracting entire contents', test, 0, test, test.childNodes.length, 'test');
  testExtractContents('Extracting single text node', test, 0, test, 1, 'test_text');
  testExtractContents('Extracting substring of a text node (2, 5)', test.firstChild, 2, test.firstChild, 5, 'test_substring');
  testExtractContents('Extracting single text node and start of span', test, 0, test.childNodes[1], 0, 'test_text_with_start_tag');
  testExtractContents('Extracting single text node and a span', test, 0, test, 2, 'test_text_and_span');
  testExtractContents('Extracting span through first b', firstElement('span'), 0, firstElement('b'), 0, 'test_span_b');
  testExtractContents('Extracting code through blockquote', firstElement('code'), 0, firstElement('blockquote'), 1, 'test_code_blockquote');
  testExtractContents('Extracting wbr through blockquote', firstElement('wbr'), 0, firstElement('blockquote'), 1, 'test_wbr_blockquote');
  testExtractContents('Extracting q through header', firstElement('q'), 0, firstElement('header'), 1, 'test_q_header');
  testExtractContents('Extracting q through header using node index', test, 3, test, 7, 'test_q_header');
  testExtractContents('Extracting dfn through header', firstElement('dfn'), 0, firstElement('header'), 1, 'test_q_header');
  testExtractContents('Extracting script through dfn', firstElement('script'), 0, firstElement('dfn'), 1, 'test_script_dfn');
  testExtractContents('Extracting blockquote through em', firstElement('blockquote'), 0, firstElement('em'), firstElement('em').childNodes.length, 'test_blockquote_em');
}

