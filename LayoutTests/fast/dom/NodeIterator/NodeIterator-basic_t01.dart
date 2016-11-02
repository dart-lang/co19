/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks the basic functionality of NodeIterator.
 */
import "dart:html";
import "../../../resources/testharness.dart";


main() {
  createSampleDOM()
  {
    // Tree order: #a -> "b" -> #c -> #d -> "e" -> #f -> "g" -> <!--h--> -> "i" -> <!--j-->.
    var div = document.createElement('div');
    div.id = 'a';
    div.innerHtml = 'b<div id="c"><div id="d">e<span id="f">g<!--h--></span>i</div><!--j--></div>';
    return div;
  }

  test(() {
    var root = createSampleDOM();
    var iterator = new NodeIterator(root, 0xFFFFFFFF);
    assert_true(iterator is NodeIterator);
    assert_equals(iterator.root, root);
    assert_equals(iterator.referenceNode, root);
    assert_equals(iterator.pointerBeforeReferenceNode, true);
    assert_equals(iterator.whatToShow, 0xFFFFFFFF);
    //assert_equals(iterator.filter, null);
  }, 'Construct a NodeIterator by document.createNodeIterator().');

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

  // |expectedNodes| should be an array of objects that can be passed to |assert_node|.
  testIteratorForwardAndBackward(iterator, expectedNodes)
  {
    assert_equals(iterator.referenceNode, iterator.root);
    assert_equals(iterator.pointerBeforeReferenceNode, true);

    // Going forward.
    var index = 0;
    var node;
    while ((node = iterator.nextNode()) != null) {
      assert_node(node, expectedNodes[index]);
      assert_node(iterator.referenceNode, expectedNodes[index]);
      assert_equals(iterator.pointerBeforeReferenceNode, false);
      ++index;
    }

    assert_equals(index, expectedNodes.length);
    assert_equals(node, null);
    assert_node(iterator.referenceNode, expectedNodes[expectedNodes.length - 1]);
    assert_equals(iterator.pointerBeforeReferenceNode, false);

    // Going backward.
    --index;
    while ((node = iterator.previousNode()) != null) {
      assert_node(node, expectedNodes[index]);
      assert_node(iterator.referenceNode, expectedNodes[index]);
      assert_equals(iterator.pointerBeforeReferenceNode, true);
      --index;
    }

    assert_equals(index, -1);
    assert_equals(node, null);
    assert_node(iterator.referenceNode, expectedNodes[0]);
    assert_equals(iterator.pointerBeforeReferenceNode, true);
  }

  var expectedAll = [
  { 'type': DivElement, 'id': 'a' },
  { 'type': Text, 'nodeValue': 'b' },
  { 'type': DivElement, 'id': 'c' },
  { 'type': DivElement, 'id': 'd' },
  { 'type': Text, 'nodeValue': 'e' },
  { 'type': SpanElement, 'id': 'f' },
  { 'type': Text, 'nodeValue': 'g' },
  { 'type': Comment, 'nodeValue': 'h' },
  { 'type': Text, 'nodeValue': 'i' },
  { 'type': Comment, 'nodeValue': 'j' },
  ];

  test(() {
    var iterator = new NodeIterator(createSampleDOM(), 0xFFFFFFFF);
    testIteratorForwardAndBackward(iterator, expectedAll);
  }, 'Iterate over all nodes forward then backward.');

  test(() {
    var expected = [
    { 'type': DivElement, 'id': 'a' },
    { 'type': DivElement, 'id': 'c' },
    { 'type': DivElement, 'id': 'd' },
    { 'type': SpanElement, 'id': 'f' },
    ];
    var iterator = new NodeIterator(createSampleDOM(), NodeFilter.SHOW_ELEMENT);
    testIteratorForwardAndBackward(iterator, expected);
  }, 'Iterate over all elements forward then backward.');

  test(() {
    var expected = [
    { 'type': Text, 'nodeValue': 'b' },
    { 'type': Text, 'nodeValue': 'e' },
    { 'type': Text, 'nodeValue': 'g' },
    { 'type': Text, 'nodeValue': 'i' },
    ];
    var iterator = new NodeIterator(createSampleDOM(), NodeFilter.SHOW_TEXT);
    testIteratorForwardAndBackward(iterator, expected);
  }, 'Iterate over all text nodes forward then backward.');

  test(() {
    var expected = [
    { 'type': Comment, 'nodeValue': 'h' },
    { 'type': Comment, 'nodeValue': 'j' },
    ];
    var iterator = new NodeIterator(createSampleDOM(), NodeFilter.SHOW_COMMENT);
    testIteratorForwardAndBackward(iterator, expected);
  }, 'Iterate over all comment nodes forward then backward.');

  test(() {
    var iterator = new NodeIterator(createSampleDOM(), 0);
    assert_equals(iterator.referenceNode, iterator.root);
    assert_equals(iterator.pointerBeforeReferenceNode, true);

    assert_equals(iterator.nextNode(), null);
    assert_equals(iterator.referenceNode, iterator.root);
    assert_equals(iterator.pointerBeforeReferenceNode, true);

    assert_equals(iterator.previousNode(), null);
    assert_equals(iterator.referenceNode, iterator.root);
    assert_equals(iterator.pointerBeforeReferenceNode, true);
  }, 'Test the behavior of NodeIterator when no nodes match with the given filter.');

  /*
  // no such ctor in dart: NodeIterator(node,int,filter) 
  test(() {
    var expected = [
    { 'type': Text, 'nodeValue': 'e' },
    { 'type': Element, 'id': 'f' },
    { 'type': Comment, 'nodeValue': 'j' },
    ];
    var filter = (node) {
      if (node.nodeType == Node.ELEMENT_NODE && node.id == 'f' ||
          node.nodeType == Node.TEXT_NODE && node.nodeValue == 'e' ||
          node.nodeType == Node.COMMENT_NODE && node.nodeValue == 'j') {
        return NodeFilter.FILTER_ACCEPT;
      }
      return NodeFilter.FILTER_REJECT;
    };
    var iterator = new NodeIterator(createSampleDOM(),
      NodeFilter.SHOW_ALL, filter);
    testIteratorForwardAndBackward(iterator, expected);
  }, 'Test the behavior of NodeIterator when NodeFilter is specified.');
  */

  /*
  // no such ctor in dart: NodeIterator(node,int,filter,...) 
  test(() {
    var filter = (node) {
      return NodeFilter.FILTER_ACCEPT;
    };
    [true, false].forEach((expandEntityReferences) {
      var iterator = new NodeIterator(createSampleDOM(),
        NodeFilter.SHOW_ALL, filter, expandEntityReferences);
      assert_true(iterator is NodeIterator);
      assert_false(iterator.expandEntityReferences);
      testIteratorForwardAndBackward(iterator, expectedAll);
    });
  }, 'Test that the fourth argument (expandEntityReferences) is ignored.');
  */
}
