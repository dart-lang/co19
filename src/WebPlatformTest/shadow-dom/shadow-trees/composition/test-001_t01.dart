/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
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
 * @assertion Composition: Composition algorithm
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  equals(actual,expected,reason) => Expect.equals(expected,actual,reason);

  var d = document;

  var div = d.createElement('div');
  div.setInnerHtml('' +
    '<ul id="host">' +
            '<li id="li1" class="shadow">' +
                    '<a id="a11" class="cl1" href="#">Link11 Shadow</a>' +
                    '<a id="a12" class="cl2" href="#">Link12 Shadow</a>' +
                    '<a id="a13" class="cl1" href="#">Link13 Shadow</a>' +
            '</li>' +
            '<li id="li2">' +
                    '<a id="a21" href="#">Link21</a><a id="a22" href="#">Link22</a>' +
            '</li>' +
            '<li id="li3" class="shadow">' +
                    '<a id="a31" href="#">Link31 Shadow</a><a id="a32" href="#">Link32 Shadow</a>' +
            '</li>' +
            '<li id="li4" class="shadow2">' +
                    '<a id="a41" href="#">Link41 Shadow 2</a><a id="a42" href="#">Link22 Shadow 2</a>' +
            '</li>' +
            '<li id="li5" class="shadow2">' +
                    '<a id="a51" href="#">Link51 Shadow</a><a id="a52" href="#">Link52 Shadow 2</a>' +
            '</li>' +
    '</ul>',
    treeSanitizer: new NullTreeSanitizer());

  d.body.append(div);

  //make nested shadow tree to check the reprojection
  var li1 = d.querySelector('#li1');
  var s = createSR(li1);
  var shadowLI1 = document.createElement('li');
  shadowLI1.setInnerHtml('<content select=".cl1"></content>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(shadowLI1);

  //Shadow root to play with
  var ul = d.querySelector('#host');

  //make an old shadow tree
  var s2 = createSR(ul);
  var div2 = d.createElement('div');
  div2.setInnerHtml('<ul><content select=".shadow2"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s2.append(div2);

  // At this point visible: li4 and li5
  Expect.isTrue(d.querySelector('#li4').offsetTop > 0, 'Point 1: Node that match insertion ' +
      'point criteria should be rendered');
  Expect.isTrue(d.querySelector('#li5').offsetTop > 0, 'Point 2: Node that match insertion ' +
      'point criteria should be rendered');
  equals(d.querySelector('#li1').offsetTop, 0, 'Point 3: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  equals(d.querySelector('#li2').offsetTop, 0, 'Point 4: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  equals(d.querySelector('#li3').offsetTop, 0, 'Point 5: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');

  //check the nested tree
  equals(d.querySelector('#a11').offsetTop, 0,
      'Point 6: Aleady distributed nodes should behave like a shadow host child nodes');
  equals(d.querySelector('#a13').offsetTop, 0,
      'Point 7: Aleady distributed nodes should behave like a shadow host child nodes');
  equals(d.querySelector('#a12').offsetTop, 0,
      'Point 8: Aleady distributed nodes should behave like a shadow host child nodes');



  //make a young shadow tree
  var s3 = createSR(ul);
  var div3 = d.createElement('div');
  div3.setInnerHtml('<ul><content select=".shadow"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s3.append(div3);

  //At this point: li1 and li3 visible, others not
  Expect.isTrue(d.querySelector('#li1').offsetTop > 0, 'Point 21: Node that match insertion ' +
      'point criteria should be rendered');
  Expect.isTrue(d.querySelector('#li3').offsetTop > 0, 'Point 22: Node that match insertion ' +
      'point criteria should be rendered');
  equals(d.querySelector('#li2').offsetTop, 0, 'Point 23: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  equals(d.querySelector('#li4').offsetTop, 0, 'Point 24: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  equals(d.querySelector('#li5').offsetTop, 0, 'Point 25: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');

  //check the reprojected nodes (a11 and a13 visible, a12 not)
  Expect.isTrue(d.querySelector('#a11').offsetTop > 0,
      'Point 26: Aleady distributed nodes should behave like a shadow host child nodes');
  equals(d.querySelector('#a12').offsetTop, 0,
      'Point 27: Aleady distributed nodes should behave like a shadow host child nodes');
  Expect.isTrue(d.querySelector('#a13').offsetTop > 0,
      'Point 28: Aleady distributed nodes should behave like a shadow host child nodes');

  var shadow = d.createElement('shadow');
  s3.append(shadow);

  //At this point: li1, li3, li4 and li5 visible li2 not
  Expect.isTrue(d.querySelector('#li1').offsetTop > 0, 'Point 31: Node that match insertion ' +
      'point criteria should be rendered');
  Expect.isTrue(d.querySelector('#li3').offsetTop > 0, 'Point 32: Node that match insertion ' +
      'point criteria should be rendered');
  equals(d.querySelector('#li2').offsetTop, 0, 'Point 33: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  Expect.isTrue(d.querySelector('#li4').offsetTop > 0, 'Point 34: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  Expect.isTrue(d.querySelector('#li5').offsetTop > 0, 'Point 35: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');

  //check the reprojected nodes (a11 and a13 visible, a12 not)
  Expect.isTrue(d.querySelector('#a11').offsetTop > 0,
      'Point 36: Aleady distributed nodes should behave like a shadow host child nodes');
  equals(d.querySelector('#a12').offsetTop, 0,
      'Point 37: Aleady distributed nodes should behave like a shadow host child nodes');
  Expect.isTrue(d.querySelector('#a13').offsetTop > 0,
      'Point 38: Aleady distributed nodes should behave like a shadow host child nodes');

  var shadow2 = d.createElement('shadow');
  s3.append(shadow2);

  // Nothing should be changed
  //At this point: li1, li3, li4 and li5 visible li2 not
  Expect.isTrue(d.querySelector('#li1').offsetTop > 0, 'Point 41: Node that match insertion ' +
      'point criteria should be rendered');
  Expect.isTrue(d.querySelector('#li3').offsetTop > 0, 'Point 42: Node that match insertion ' +
      'point criteria should be rendered');
  equals(d.querySelector('#li2').offsetTop, 0, 'Point 43: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  Expect.isTrue(d.querySelector('#li4').offsetTop > 0, 'Point 44: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  Expect.isTrue(d.querySelector('#li5').offsetTop > 0, 'Point 45: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');

  //check the reprojected nodes (a11 and a13 visible, a12 not)
  Expect.isTrue(d.querySelector('#a11').offsetTop > 0,
      'Point 46: Aleady distributed nodes should behave like a shadow host child nodes');
  equals(d.querySelector('#a12').offsetTop, 0,
      'Point 47: Aleady distributed nodes should behave like a shadow host child nodes');
  Expect.isTrue(d.querySelector('#a13').offsetTop > 0,
      'Point 48: Aleady distributed nodes should behave like a shadow host child nodes');
}
