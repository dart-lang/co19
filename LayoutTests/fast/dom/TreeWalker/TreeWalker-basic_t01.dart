/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks the basic functionality of TreeWalker.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
//import "../../../testcommon.dart";
import "../../../resources/testharness.dart";

main() {
  createSampleDOM()
  {
    // Tree structure:
    //             #a
    //             |
    //        +----+----+
    //        |         |
    //       "b"        #c
    //                  |
    //             +----+----+
    //             |         |
    //            #d      <!--j-->
    //             |
    //        +----+----+
    //        |    |    |
    //       "e"  #f   "i"
    //             |
    //          +--+--+
    //          |     |
    //         "g" <!--h-->
    var div = document.createElement('div');
    div.id = 'a';
    div.innerHtml = 'b<div id="c"><div id="d">e<span id="f">g<!--h--></span>i</div><!--j--></div>';
    return div;
  }

  test(() {
    var root = createSampleDOM();
    var walker = new TreeWalker(root, 0xFFFFFFFF);
    assert_true(walker is TreeWalker);
    assert_equals(walker.root, root);
    assert_equals(walker.whatToShow, 0xFFFFFFFF);
    assert_equals(walker.filter, null);
    assert_equals(walker.currentNode, root);
    //assert_readonly(walker, 'root');
    //assert_readonly(walker, 'whatToShow');
    //assert_readonly(walker, 'filter');
    assert_idl_attribute(walker.parentNode);
    assert_idl_attribute(walker.firstChild);
    assert_idl_attribute(walker.lastChild);
    assert_idl_attribute(walker.previousSibling);
    assert_idl_attribute(walker.nextSibling);
    assert_idl_attribute(walker.previousNode);
    assert_idl_attribute(walker.nextNode);
  }, 'Construct a TreeWalker by new TreeWalker().');

  test(() {
    assert_throws(() { new TreeWalker(); });
    assert_throws(() { new TreeWalker(null); });
    assert_throws(() { new TreeWalker(new Object()); });
    assert_throws(() { new TreeWalker(1); });
  }, 'Give an invalid root node to new TreeWalker().');

  // |expected| should be an object indicating the expected type of node.
  assert_node(actual, expected)
  {
    // have to use more strict type assertions for dart,
    // since type checking is with runtimeType,
    // ex. DivElement instead of Element
    assert_equals(actual.runtimeType, expected['type']);
    if (expected.containsKey('id'))
      assert_equals(actual.id, expected['id']);
    if (expected.containsKey('nodeValue'))
      assert_equals(actual.nodeValue, expected['nodeValue']);
  }

  test(() {
    var root = createSampleDOM();
    var walker = new TreeWalker(root, 0xFFFFFFFF);
    var f = root.lastChild.firstChild.childNodes[1];  // An element node: div#f.
    var body = document.body;  // An element outside |root|.

    assert_node(walker.currentNode, { 'type': DivElement, 'id': 'a' });
    assert_equals(walker.parentNode(), null);
    assert_node(walker.currentNode, { 'type': DivElement, 'id': 'a' });
    assert_node(walker.firstChild(), { 'type': Text, 'nodeValue': 'b' });
    assert_node(walker.currentNode, { 'type': Text, 'nodeValue': 'b' });
    assert_node(walker.nextSibling(), { 'type': DivElement, 'id': 'c' });
    assert_node(walker.currentNode, { 'type': DivElement, 'id': 'c' });
    assert_node(walker.lastChild(), { 'type': Comment, 'nodeValue': 'j' });
    assert_node(walker.currentNode, { 'type': Comment, 'nodeValue': 'j' });
    assert_node(walker.previousSibling(), { 'type': DivElement, 'id': 'd' });
    assert_node(walker.currentNode, { 'type': DivElement, 'id': 'd' });
    assert_node(walker.nextNode(), { 'type': Text, 'nodeValue': 'e' });
    assert_node(walker.currentNode, { 'type': Text, 'nodeValue': 'e' });
    assert_node(walker.parentNode(), { 'type': DivElement, 'id': 'd' });
    assert_node(walker.currentNode, { 'type': DivElement, 'id': 'd' });
    assert_node(walker.previousNode(), { 'type': DivElement, 'id': 'c' });
    assert_node(walker.currentNode, { 'type': DivElement, 'id': 'c' });
    assert_equals(walker.nextSibling(), null);
    assert_node(walker.currentNode, { 'type': DivElement, 'id': 'c' });
    walker.currentNode = f;
    assert_equals(walker.currentNode, f);
  }, 'Walk over nodes.');
}
