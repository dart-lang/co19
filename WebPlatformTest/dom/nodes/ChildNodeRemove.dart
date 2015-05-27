import 'dart:html';
import "../../Utils/expectWeb.dart";

void testRemove(node, parent, type) {
  assert_equals(node.parentNode, null, "Node should not have a parent");
  parent.append(node);
  assert_equals(node.parentNode, parent, "Appended node should have a parent");
  node.remove();
  assert_equals(node.parentNode, null, "Removed node should not have a parent");
  assert_array_equals(parent.childNodes, [], "Parent should not have children");
}

void testRemoveSibling(node, parent, type) {
  assert_equals(node.parentNode, null, "Node should not have a parent");
  var before = parent.append(new Comment("before"));
  parent.append(node);
  var after = parent.append(new Comment("after"));
  assert_equals(node.parentNode, parent, "Appended node should have a parent");
  node.remove();
  assert_equals(node.parentNode, null, "Removed node should not have a parent");
  assert_array_equals(parent.childNodes, [before, after], "Parent should have two children left");
}
