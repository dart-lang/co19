/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests parsing and re-serialization of some CSS selectors.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.head.id = "head";

  parseThenSerializeRule(rule)
  {
    var styleElement = document.getElementById("style");
    var head = document.getElementById("head");
    if (styleElement != null)
      styleElement.remove();

    styleElement = document.createElement("style");
    styleElement.id = "style";
    head = document.getElementById("head");
    head.append(styleElement);

    styleElement.append(new Text(rule));
    print('rule=' + rule + ', css=' + styleElement.sheet.cssRules[0].cssText);
    return styleElement.sheet.cssRules[0].cssText;
  }

  String stripSpaces(String s) {
    return s.replaceAll(" ", "");
  }

  bool shouldBeIgnoreSpaces(String actual, String expected) {
    return shouldBe(stripSpaces(actual), stripSpaces(expected));
  }

  testSelectorRoundTrip(selector) {
    //shouldBe(parseThenSerializeRule("$selector { }"), "$selector { }");
    shouldBeIgnoreSpaces(parseThenSerializeRule("$selector {}"), "$selector {}");
  }

  testSelectorRoundTrip('*');
  testSelectorRoundTrip('a');
  testSelectorRoundTrip('#a');
  testSelectorRoundTrip('.a');
  testSelectorRoundTrip(':active');
  testSelectorRoundTrip('[a]');
  testSelectorRoundTrip('[a="b"]');
  testSelectorRoundTrip('[a~="b"]');
  testSelectorRoundTrip('[a|="b"]');
  testSelectorRoundTrip('[a^="b"]');
  testSelectorRoundTrip(r'[a$="b"]');
  testSelectorRoundTrip('[a*="b"]');

  debug('');

  //testSelectorRoundTrip('*|a');
  //testSelectorRoundTrip('n|a');
  //testSelectorRoundTrip('*|*');
  //testSelectorRoundTrip('n|*');
  //testSelectorRoundTrip('[*|a]');
  //testSelectorRoundTrip('[n|a]');

  //debug('');

  testSelectorRoundTrip('a:active');
  testSelectorRoundTrip('a b');
  testSelectorRoundTrip('a + b');
  testSelectorRoundTrip('a ~ b');
  testSelectorRoundTrip('a > b');

  debug('');

  testSelectorRoundTrip(":active");
  testSelectorRoundTrip(":checked");
  testSelectorRoundTrip(":disabled");
  testSelectorRoundTrip(":empty");
  testSelectorRoundTrip(":enabled");
  testSelectorRoundTrip(":first-child");
  testSelectorRoundTrip(":first-of-type");
  testSelectorRoundTrip(":focus");
  testSelectorRoundTrip(":hover");
  testSelectorRoundTrip(":indeterminate");
  testSelectorRoundTrip(":link");
  testSelectorRoundTrip(":root");
  testSelectorRoundTrip(":target");
  testSelectorRoundTrip(":visited");

  debug('');

  testSelectorRoundTrip(":lang(a)");
  testSelectorRoundTrip(":not(a)");
  //testSelectorRoundTrip(":-webkit-any(a,b,p)");

  debug('');

  //testSelectorRoundTrip("::after");
  //testSelectorRoundTrip("::before");
  //testSelectorRoundTrip("::first-letter");
  //testSelectorRoundTrip("::first-line");
  //testSelectorRoundTrip("::selection");
/*
  debug('');

  testSelectorRoundTrip(":-webkit-any-link");
  testSelectorRoundTrip(":-webkit-autofill");
  testSelectorRoundTrip(":-webkit-drag");

  debug('');

  shouldBe(parseThenSerializeRule('::-webkit-file-upload-button { }'), '*::-webkit-file-upload-button { }');
  shouldBe(parseThenSerializeRule('::-webkit-search-cancel-button { }'), '*::-webkit-search-cancel-button { }');
  shouldBe(parseThenSerializeRule('::-webkit-search-decoration { }'), '*::-webkit-search-decoration { }');
  shouldBe(parseThenSerializeRule('::-webkit-search-results-button { }'), '*::-webkit-search-results-button { }');
  shouldBe(parseThenSerializeRule('::-webkit-search-results-decoration { }'), '*::-webkit-search-results-decoration { }');
  shouldBe(parseThenSerializeRule('::-webkit-slider-thumb { }'), '*::-webkit-slider-thumb { }');

  debug('');

  testSelectorRoundTrip("a::-webkit-slider-thumb");
  shouldBe(parseThenSerializeRule('a ::-webkit-slider-thumb { }'), 'a *::-webkit-slider-thumb { }');
  testSelectorRoundTrip("[a]::-webkit-slider-thumb");
  shouldBe(parseThenSerializeRule('[a] ::-webkit-slider-thumb { }'), '[a] *::-webkit-slider-thumb { }');
  testSelectorRoundTrip(".a::-webkit-slider-thumb");
  shouldBe(parseThenSerializeRule('.a ::-webkit-slider-thumb { }'), '.a *::-webkit-slider-thumb { }');
  testSelectorRoundTrip("#a::-webkit-slider-thumb");
  shouldBe(parseThenSerializeRule('#a ::-webkit-slider-thumb { }'), '#a *::-webkit-slider-thumb { }');
  shouldBe(parseThenSerializeRule('* ::-webkit-slider-thumb { }'), '* *::-webkit-slider-thumb { }');

  debug('');

  testSelectorRoundTrip("a[b]::-webkit-slider-thumb");
  testSelectorRoundTrip("a.b::-webkit-slider-thumb");
  testSelectorRoundTrip("a#b::-webkit-slider-thumb");
  testSelectorRoundTrip("a[b].c#d::-webkit-slider-thumb");

  debug('');

  testSelectorRoundTrip('input:not([type="file"]):focus');
  testSelectorRoundTrip(':-webkit-any([type="file"])');
  testSelectorRoundTrip(':-webkit-any(:hover)');
  testSelectorRoundTrip('input:-webkit-any([type="file"],:hover,:focus):enabled');
  testSelectorRoundTrip(':-webkit-any(input[type="file"],a:hover,button:focus)');
  testSelectorRoundTrip(':-webkit-any(.class1.class2.class3)');
  testSelectorRoundTrip(':-webkit-any(.class1:hover)');
  testSelectorRoundTrip(':-webkit-any(a.class1.class2.class3:hover)');
*/
  debug('');

  shouldBeIgnoreSpaces(parseThenSerializeRule('*:active { }'), ':active { }');
  //shouldBe(parseThenSerializeRule('|a { }'), 'a { }');
  shouldBeIgnoreSpaces(parseThenSerializeRule('|a { }'), '|a { }');

  debug('');

  //shouldBe(parseThenSerializeRule('input[type=file]:focus { }'), 'input[type="file"]:focus { }');

  debug('');

  shouldBeIgnoreSpaces(parseThenSerializeRule('a+b { }'), 'a + b { }');
  shouldBeIgnoreSpaces(parseThenSerializeRule('a~b { }'), 'a ~ b { }');
  shouldBeIgnoreSpaces(parseThenSerializeRule('a>b { }'), 'a > b { }');

  debug('');
/*
  shouldBeIgnoreSpaces(parseThenSerializeRule(':after { }'), '::after { }');
  shouldBeIgnoreSpaces(parseThenSerializeRule(':before { }'), '::before { }');
  shouldBeIgnoreSpaces(parseThenSerializeRule(':first-letter { }'), '::first-letter { }');
  shouldBeIgnoreSpaces(parseThenSerializeRule(':first-line { }'), '::first-line { }');
  //shouldBe(parseThenSerializeRule(':-webkit-any(    a.class1  ,  	#id,[attr]  ) { }'),':-webkit-any(a.class1,#id,[attr]) { }');

  debug('');*/
}
