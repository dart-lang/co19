/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test case ensures that nameNodeListCache should be
 * invalidate when name attribute changes.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = document.implementation.createHtmlDocument('');
  var element1;
  var element2;

  createElement(type, properties)
  {
    var element = doc.createElement(type);

    for (var i in properties.keys)
      element.setAttribute(i,properties[i]);

    doc.body.append(element);
    return element;
  }

  createTwoElements(tagName)
  {
    element1 = createElement(tagName, {'name': 'fullname'});
    element2 = createElement(tagName, {'name': 'fullname'});
  }

  runTest(tagName)
  {
    debug(tagName);
    createTwoElements(tagName); 
    shouldBe(doc.getElementsByName('fullname').length, 2);
    doc.querySelector(tagName).setAttribute('name', 'changed-name'); 
    shouldBe(doc.getElementsByName('fullname').length, 1);
    element1.remove();
    element2.remove();
  }

  runTest('a');
  runTest('applet');
  runTest('embed');
  runTest('section');
  runTest('frame');
  runTest('form');
  runTest('iframe');
  runTest('img');
  runTest('map');
  runTest('meta');
  runTest('object');
  runTest('param');
}
