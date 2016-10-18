
library check_layout;

import 'dart:html';
import '../../Utils/expect.dart';

class Flag {
  int checked = 0;
}

getComputedStyle(node) => node.getComputedStyle();

insertAfter(nodeToAdd, referenceNode)
{
  if (referenceNode == document.body) {
    document.body.append(nodeToAdd);
    return;
  }

  if (referenceNode.nextNode)
    referenceNode.parentNode.insertBefore(nodeToAdd, referenceNode.nextNode);
  else
    referenceNode.parentNode.append(nodeToAdd);
}

int checkSubtreeExpectedValues(parent, failures) {
  int checkedLayout = checkExpectedValues(parent, failures);
  parent.childNodes.forEach((node) {
    checkedLayout |= checkSubtreeExpectedValues(node, failures);
  });
  return checkedLayout;
}

int checkAttribute(output, node, attribute) {
  if (node is Element) {
    String res = node.getAttribute(attribute);
    bool isNotEmpty= res != null && res != "";
    output.checked |= isNotEmpty?1:0;
    if (!isNotEmpty) {
        return null;
    }
    String res2=res.substring(0, res.length-2);// cut suffix "px"
    return int.parse(res, onError:(String source){throw new FormatException("bad attr value:'$res'");});
  } else {
    return null;
  }
}

int checkExpectedValues(node, failures) {
    var output = new Flag();
    var expectedWidth = checkAttribute(output, node, "data-expected-width");
    if (expectedWidth != null) {
        if (node.offsetWidth != expectedWidth)
            failures.add("Expected ${expectedWidth} for width, but got ${node.offsetWidth}. ");
    }

    var expectedHeight = checkAttribute(output, node, "data-expected-height");
    if (expectedHeight != null) {
        if (node.offsetHeight != expectedHeight)
            failures.add("Expected ${expectedHeight} for height, but got '${node.offsetHeight}'. ");
    }

    var expectedOffset = checkAttribute(output, node, "data-offset-x");
    if (expectedOffset != null) {
        if (node.offsetLeft != expectedOffset)
            failures.add("Expected ${expectedOffset} for offsetLeft, but got ${node.offsetLeft}. ");
    }

    expectedOffset = checkAttribute(output, node, "data-offset-y");
    if (expectedOffset != null) {
        if (node.offsetTop != expectedOffset)
            failures.add("Expected ${expectedOffset} for offsetTop, but got ${node.offsetTop}. ");
    }

    expectedWidth = checkAttribute(output, node, "data-expected-client-width");
    if (expectedWidth != null) {
        if (node.clientWidth != expectedWidth)
            failures.add("Expected ${expectedWidth} for clientWidth, but got ${node.clientWidth}. ");
    }

    expectedHeight = checkAttribute(output, node, "data-expected-client-height");
    if (expectedHeight != null) {
        if (node.clientHeight != expectedHeight)
            failures.add("Expected ${expectedHeight} for clientHeight, but got ${node.clientHeight}. ");
    }

    expectedWidth = checkAttribute(output, node, "data-expected-scroll-width");
    if (expectedWidth != null) {
        if (node.scrollWidth != expectedWidth)
            failures.add("Expected ${expectedWidth} for scrollWidth, but got ${node.scrollWidth}. ");
    }

    expectedHeight = checkAttribute(output, node, "data-expected-scroll-height");
    if (expectedHeight != null) {
        if (node.scrollHeight != expectedHeight)
            failures.add("Expected ${expectedHeight} for scrollHeight, but got ${node.scrollHeight}. ");
    }

    expectedOffset = checkAttribute(output, node, "data-total-x");
    if (expectedOffset != null) {
        var totalLeft = node.clientLeft + node.offsetLeft;
        if (totalLeft != expectedOffset)
            failures.add("Expected ${expectedOffset} for clientLeft+offsetLeft, but got ${totalLeft}, clientLeft: ${node.clientLeft}, offsetLeft: ${node.offsetLeft}. ");
    }

    expectedOffset = checkAttribute(output, node, "data-total-y");
    if (expectedOffset != null) {
        var totalTop = node.clientTop + node.offsetTop;
        if (totalTop != expectedOffset)
            failures.add("Expected ${expectedOffset} for clientTop+offsetTop, but got ${totalTop}, clientTop: ${node.clientTop}, + offsetTop: ${node.offsetTop}. ");
    }

    var expectedDisplay = checkAttribute(output, node, "data-expected-display");
    if (expectedDisplay != null) {
        var actualDisplay = getComputedStyle(node).display;
        if (actualDisplay != expectedDisplay)
            failures.add("Expected ${expectedDisplay} for display, but got ${actualDisplay}. ");
    }

    var expectedPaddingTop = checkAttribute(output, node, "data-expected-padding-top");
    if (expectedPaddingTop != null) {
        var actualPaddingTop = getComputedStyle(node).paddingTop;
        // Trim the unit "px" from the output.
        actualPaddingTop = actualPaddingTop.substring(0, actualPaddingTop.length - 2);
        if (actualPaddingTop != expectedPaddingTop)
            failures.add("Expected ${expectedPaddingTop} for padding-top, but got ${actualPaddingTop}. ");
    }

    var expectedPaddingBottom = checkAttribute(output, node, "data-expected-padding-bottom");
    if (expectedPaddingBottom != null) {
        var actualPaddingBottom = getComputedStyle(node).paddingBottom;
        // Trim the unit "px" from the output.
        actualPaddingBottom = actualPaddingBottom.substring(0, actualPaddingBottom.length - 2);
        if (actualPaddingBottom != expectedPaddingBottom)
            failures.add("Expected ${expectedPaddingBottom} for padding-bottom, but got ${actualPaddingBottom}. ");
    }

    var expectedPaddingLeft = checkAttribute(output, node, "data-expected-padding-left");
    if (expectedPaddingLeft != null) {
        var actualPaddingLeft = getComputedStyle(node).paddingLeft;
        // Trim the unit "px" from the output.
        actualPaddingLeft = actualPaddingLeft.substring(0, actualPaddingLeft.length - 2);
        if (actualPaddingLeft != expectedPaddingLeft)
            failures.add("Expected ${expectedPaddingLeft} for padding-left, but got ${actualPaddingLeft}. ");
    }

    var expectedPaddingRight = checkAttribute(output, node, "data-expected-padding-right");
    if (expectedPaddingRight != null) {
        var actualPaddingRight = getComputedStyle(node).paddingRight;
        // Trim the unit "px" from the output.
        actualPaddingRight = actualPaddingRight.substring(0, actualPaddingRight.length - 2);
        if (actualPaddingRight != expectedPaddingRight)
            failures.add("Expected ${expectedPaddingRight} for padding-right, but got ${actualPaddingRight}. ");
    }

    var expectedMarginTop = checkAttribute(output, node, "data-expected-margin-top");
    if (expectedMarginTop != null) {
        var actualMarginTop = getComputedStyle(node).marginTop;
        // Trim the unit "px" from the output.
        actualMarginTop = actualMarginTop.substring(0, actualMarginTop.length - 2);
        if (actualMarginTop != expectedMarginTop)
            failures.add("Expected ${expectedMarginTop} for margin-top, but got ${actualMarginTop}. ");
    }

    var expectedMarginBottom = checkAttribute(output, node, "data-expected-margin-bottom");
    if (expectedMarginBottom != null) {
        var actualMarginBottom = getComputedStyle(node).marginBottom;
        // Trim the unit "px" from the output.
        actualMarginBottom = actualMarginBottom.substring(0, actualMarginBottom.length - 2);
        if (actualMarginBottom != expectedMarginBottom)
            failures.add("Expected ${expectedMarginBottom} for margin-bottom, but got ${actualMarginBottom}. ");
    }

    var expectedMarginLeft = checkAttribute(output, node, "data-expected-margin-left");
    if (expectedMarginLeft != null) {
        var actualMarginLeft = getComputedStyle(node).marginLeft;
        // Trim the unit "px" from the output.
        actualMarginLeft = actualMarginLeft.substring(0, actualMarginLeft.length - 2);
        if (actualMarginLeft != expectedMarginLeft)
            failures.add("Expected ${expectedMarginLeft} for margin-left, but got ${actualMarginLeft}. ");
    }

    var expectedMarginRight = checkAttribute(output, node, "data-expected-margin-right");
    if (expectedMarginRight != null) {
        var actualMarginRight = getComputedStyle(node).marginRight;
        // Trim the unit "px" from the output.
        actualMarginRight = actualMarginRight.substring(0, actualMarginRight.length - 2);
        if (actualMarginRight != expectedMarginRight)
            failures.add("Expected ${expectedMarginRight} for margin-right, but got ${actualMarginRight}. ");
    }

    return output.checked;
}

bool checkLayout(selectorList, [outputContainer]) {
  var result = true;
  if (selectorList == null) {
    throw "You must provide a CSS selector of nodes to check.";
  }
  var nodes = document.querySelectorAll(selectorList);
  //nodes = Array.prototype.slice.call(nodes);
  //nodes.reverse();
  int checkedLayout = 0;
  nodes.forEach((node) {
    var failures = [];
    checkedLayout |= checkExpectedValues(node.parentNode, failures);
    checkedLayout |= checkSubtreeExpectedValues(node, failures);

    Node container = (node.parentNode as Element).className == 'container' ? node.parentNode : node;

    var pre = document.createElement('pre');
    if (failures.length > 0) {
      pre.className = 'FAIL';
      result = false;
    }
    pre.append(new Text(failures.length > 0
        ? "FAIL:\n" + failures.join('\n') + '\n\n' + (container as Element).outerHtml
        : "PASS"));

    var referenceNode = container;
    if (outputContainer != null) {
      if (outputContainer.lastChild == null) {
        // Inserting a text node so we have something to insertAfter.
        outputContainer.text = " ";
      }
      referenceNode = outputContainer.lastChild;
    }
    insertAfter(pre, referenceNode);
    if (failures.length > 0) {
      Expect.fail(failures.join('\n'));
    }
  });

  if (checkedLayout == 0) {
    var message = "FAIL: No valid data-* attributes found in selector list : "
      + selectorList.toString();
    document.body.append(new Text(message));
    Expect.fail(message);
    return false;
  }

  var pre = document.querySelector('.FAIL');
  //if (pre)
  //  setTimeout(() { pre.previousSibling.scrollIntoView(); }, 0);
  return result;
}
