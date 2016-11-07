/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test makes sure that calling the window scrolling
 * methods with less than 2 arguments or with an invalid third argument
 * throws an exception.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div style="height: 1000px; width: 1000px; border: 1px solid black;">This box should force the window to have a scrollable area to test.</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var x = 25;
  var y = 50;

  reset()
  {
    window.scrollTo(0,0);
  }

  reset();

  // scrollTo /////////////////////////
  debug('window.scrollTo Tests');

  debug("Testing - scrollTo with 0 arguments");
  shouldThrow(() => window.scrollTo());
  reset();

  debug("Testing - scrollTo with 1 argument");
  shouldThrow(() => window.scrollTo(x));
  reset();

  debug("Testing - scrollTo with a valid ScrollOptions argument");
  shouldNotThrow(() => window.scrollTo(x, y, { }));
  shouldNotThrow(() => window.scrollTo(x, y, { 'behavior': "auto" }));
  shouldNotThrow(() => window.scrollTo(x, y, { 'behavior': "instant" }));
  shouldNotThrow(() => window.scrollTo(x, y, { 'behavior': "smooth" }));

  debug("Testing - scrollTo with an invalid ScrollOptions argument");
  shouldThrow(() => window.scrollTo(x, y, { 'behavior': "" }));
  shouldThrow(() => window.scrollTo(x, y, { 'behavior': "abcd" }));
  shouldThrow(() => (window as dynamic).scrollTo(x, y, 200, "text"));

  // scroll /////////////////////////
  debug('window.scroll Tests');

  debug("Testing - scroll with 0 arguments");
  shouldThrow(() => window.scroll());
  reset();

  debug("Testing - scroll with 1 argument");
  shouldThrow(() => window.scroll(x));
  reset();

  debug("Testing - scroll with a valid ScrollOptions argument");
  shouldNotThrow(() => window.scroll(x, y, { }));
  shouldNotThrow(() => window.scroll(x, y, { 'behavior': "auto" }));
  shouldNotThrow(() => window.scroll(x, y, { 'behavior': "instant" }));
  shouldNotThrow(() => window.scroll(x, y, { 'behavior': "smooth" }));

  debug("Testing - scroll with an invalid ScrollOptions argument");
  shouldThrow(() => window.scroll(x, y, { 'behavior': "" }));
  shouldThrow(() => window.scroll(x, y, { 'behavior': "abcd" }));
  shouldThrow(() => (window as dynamic).scroll(x, y, 200, "text"));

  // scrollBy /////////////////////////
  debug('window.scrollBy Tests');

  debug("Testing - scrollBy with 0 arguments");
  shouldThrow(() => window.scrollBy());
  reset();

  debug("Testing - scrollBy with 1 argument");
  shouldThrow(() => window.scrollBy(x));
  reset();

  debug("Testing - scrollBy with a valid ScrollOptions argument");
  shouldNotThrow(() => window.scrollBy(x, y, { }));
  shouldNotThrow(() => window.scrollBy(x, y, { 'behavior': "auto" }));
  shouldNotThrow(() => window.scrollBy(x, y, { 'behavior': "instant" }));
  shouldNotThrow(() => window.scrollBy(x, y, { 'behavior': "smooth" }));

  debug("Testing - scrollBy with an invalid ScrollOptions argument");
  shouldThrow(() => window.scrollBy(x, y, { 'behavior': "" }));
  shouldThrow(() => window.scrollBy(x, y, { 'behavior': "abcd" }));
  shouldThrow(() => (window as dynamic).scrollBy(x, y, 200, "text"));
}
