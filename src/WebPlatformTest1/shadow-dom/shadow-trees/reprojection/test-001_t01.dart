/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Reprojection: The nodes distributed into that insertion point
 * must appear as if they were child nodes of the shadow host in the context
 * of distribution within the shadow DOM subtree, hosted by said shadow host
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
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

  var li1 = d.querySelector('#li1');
  var s = createSR(li1);
  //make shadow subtree
  var shadowLI1 = document.createElement('li');
  shadowLI1.setInnerHtml('<li><content select=".cl1"></content></li>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(shadowLI1);

  var ul = d.querySelector('#host');
  var s2 = createSR(ul);
  var div2 = document.createElement('div');
  div2.setInnerHtml('<ul><content select=".shadow"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s2.append(div2);


  Expect.isTrue(d.querySelector('#li1').offsetTop > 0, 'Point 1: Node that match insertion ' +
      'point criteria should be rendered');
  Expect.isTrue(d.querySelector('#li3').offsetTop > 0, 'Point 2: Node that match insertion ' +
      'point criteria should be rendered');
  Expect.equals(0, d.querySelector('#li2').offsetTop, 'Point 3: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  Expect.equals(0, d.querySelector('#li4').offsetTop, 'Point 4: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  Expect.equals(0, d.querySelector('#li5').offsetTop, 'Point 5: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');

  //check the nested tree
  Expect.isTrue(d.querySelector('#a11').offsetTop > 0,
      'Point 6: Aleady distributed nodes should behave like a shadow host child nodes');
  Expect.isTrue(d.querySelector('#a13').offsetTop > 0,
      'Point 7: Aleady distributed nodes should behave like a shadow host child nodes');
  Expect.equals(0, d.querySelector('#a12').offsetTop,
      'Point 8: Aleady distributed nodes should behave like a shadow host child nodes');
  }, 'A_04_06_01_T01');


  test(() {
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
                              '<a class="cl1" id="a51" href="#">Link51 Shadow</a><a id="a52" href="#">Link52 Shadow 2</a>' +
                      '</li>' +
      '</ul>',
      treeSanitizer: new NullTreeSanitizer());

  d.body.append(div);

  var li1 = d.querySelector('#li1');
  var s = createSR(li1);
  //make shadow subtree
  var shadowLI1 = document.createElement('li');
  shadowLI1.setInnerHtml('<li><content select=".cl1"></content></li>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(shadowLI1);

  var ul = d.querySelector('#host');
  var s2 = createSR(ul);
  var div2 = document.createElement('div');
  div2.setInnerHtml('<li><content select=".cl1"></content></li>',
      treeSanitizer: new NullTreeSanitizer());
  s2.append(div2);

  // The second distribution shouldn't render anything
  Expect.equals(0, d.querySelector('#li1').offsetTop, 'Point 1: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  Expect.equals(0, d.querySelector('#li2').offsetTop, 'Point 2: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  Expect.equals(0, d.querySelector('#li3').offsetTop, 'Point 3: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  Expect.equals(0, d.querySelector('#li4').offsetTop, 'Point 4: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');
  Expect.equals(0, d.querySelector('#li5').offsetTop, 'Point 5: Node that doen\'t match ' +
      'insertion point criteria shouldn\'t be rendered');

  //check the nested tree
  Expect.equals(0, d.querySelector('#a11').offsetTop,
      'Point 6: Aleady distributed nodes should behave like a shadow host child nodes');
  Expect.equals(0, d.querySelector('#a13').offsetTop,
      'Point 7: Aleady distributed nodes should behave like a shadow host child nodes');
  Expect.equals(0, d.querySelector('#a12').offsetTop,
      'Point 8: Aleady distributed nodes should behave like a shadow host child nodes');
  }, 'A_04_06_01_T02');
}
