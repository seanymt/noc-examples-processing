// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Recursive Tree (w/ ArrayList)

// Recursive branching "structure" without an explicitly recursive function
// Instead we have an ArrayList to hold onto N number of elements
// For every element in the ArrayList, we add 2 more elements, etc. (this is the recursion)

// An arraylist that will keep track of all current branches
ArrayList<Branch> tree;

void setup() {
  size(200,200);
  background(255);
  smooth();
  
  // Setup the arraylist and add one branch to it
  tree = new ArrayList();
  // A branch has a starting location, a starting "velocity", and a starting "timer" 
  Branch b = new Branch(new PVector(width/2,height),new PVector(0,-0.5),100);
  // Add to arraylist
  tree.add(b);
}

void draw() {
  // Try erasing the background to see how it works
  // background(255);
  
  // Let's stop when the arraylist gets too big
  if (tree.size() < 1024) {
    // For every branch in the arraylist
    for (int i = tree.size()-1; i >= 0; i--) {
      // Get the branch, update and draw it
      Branch b = tree.get(i);
      b.update();
      b.render();
      // If it's ready to split
      if (b.timeToBranch()) {
        tree.remove(i);             // Delete it
        tree.add(b.branch( 30));   // Add one going right
        tree.add(b.branch(-25));   // Add one going left
      }
    }
  }
}


