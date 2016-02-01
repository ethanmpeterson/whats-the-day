int[][] schoolYear = {
  {9, 9, 9, 9, 0, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9}, // January
  {9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 9, 9, 9, 9, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1},       // February
  {9, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 0, 3, 4, 1}, // March
  {9, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9},    // April
  {9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 9, 2, 3, 4, 1, 9, 9, 2, 3}, // May
  {9, 4, 1, 2, 9, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9},    // June
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9}, // July
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9}, // August
  {9, 9, 9, 9, 9, 9, 9, 9, 9, 0, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 5, 9, 9, 4, 1, 2},    // September
  {9, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 9, 2, 3, 4, 1, 9, 9, 2, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9}, // October
  {9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 9, 9, 9, 9, 4, 1, 2, 3, 4, 9, 9, 1, 2, 3, 4, 1, 9, 9, 2},    // November
  {9, 3, 4, 1, 2, 9, 9, 3, 4, 1, 2, 3, 9, 9, 4, 1, 2, 3, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9}  // December
}; //same array that is in the gecko firmware that is filled with the day calendar for 2015-2016 school year
int dayNum; //int to store day number
int s; // second
int m; // minute
int h; // hour
int mon; // month
int d; // day
int rectX;
int rectY;
int rectWidth;
int rectHeight;
int monthX; //variables to store values for rectangle being drawn for the user to input the month
int monthY;
int monthWidth;
int monthHeight;
int dayX; //variables to store values for rectangle being drawn for the user to input the day
int dayY;
int dayWidth;
int dayHeight;
int dayInput;
int monthInput;
boolean cButtonPressed; //will record whether the change date button has been pressed or not
boolean triPressed; // records whether a triangular button has been pressed or not
String hol; // holiday
String p1;
String p2;
String p3;
String p4;
String p1Time; //these strings will hold what time each class takes place at
String p2Time;
String p3Time;
String p4Time;
String textValue = "";


void setup() { //code runs once
size(400, 700);
noStroke();
rect(0, 0, 400, 700);
rectX = 280;
rectY = 80;
rectWidth = 100;
rectHeight = 30;
monthX = 280;
monthY = 115;
monthWidth = 50;
monthHeight = 20;
monthInput = month();
hol = "Today is a Holiday!";
p1Time = "  (8:15 AM - 9:15 AM)";
p2Time = "  (9:35 AM - 10:50 AM)";
p3Time = "  (11:15 AM - 12:30 PM)";
p4Time = "  (1:25 PM - 2:40 PM)";
}
boolean overRect(int x, int y, int width, int height) { // code snippet to form button from processing reference button example
  if (mouseX >= x && mouseX <= x + width && //returns true if mouse is hovering over rectangle specified
      mouseY >= y && mouseY <= y + height) {
    return true;
  }else{
    return false;
  }
}

boolean overTri(int x1, int y1, int x2, int y2, int x3, int y3, int px, int py) { //code snippet from GitHub to detect collision of triangle and point
  int a0 = abs((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1)); //https://github.com/jeffThompson/CollisionDetectionFunctionsForProcessing/blob/master/pointTriangle/pointTriangle.pde
  int a1 = abs((x1-px)*(y2-py)-(x2-px)*(y1-py));
  int a2 = abs((x2-px)*(y3-py)-(x3-px)*(y2-py));
  int a3 = abs((x3-px)*(y1-py)-(x1-px)*(y3-py));

  return (abs(a1+a2+a3 - a0) <= 1/256);
}

void textBox(int textX, int textY, int textWidth, int textHeight, String defaultText) {
  fill(255);
  stroke(5);
  rect(textX, textY, textWidth, textHeight); //create rectangle to house text box where user will input month and day to get schedule
  fill(150, 150, 150);
  textSize(20);
  text(defaultText, textX + 5, textY + 15);
}
void changeDate() { // function will be used to create a button allowing the user to type in a date letting them see their Schedule on that day
  stroke(5);
  fill(255);
  rect(rectX, rectY, rectWidth, rectHeight);
  fill(0);
  textSize(15);
  text("Change Date", rectX + 3, rectY + 20);
  if (overRect(rectX, rectY, rectWidth, rectHeight)) {
    fill(209, 209, 209);
    rect(rectX, rectY, rectWidth, rectHeight);
    fill(0);
    textSize(15);
    text("Change Date", rectX + 3, rectY + 20);
  if (mousePressed) {
    cButtonPressed = true;
    }
  }
  if (cButtonPressed) { // have seperate if statement to ensure code continues to run even after the mouse is released
    textBox(monthX, monthY, monthWidth, monthHeight, "mm");
    fill(255);
    stroke(5);
    triangle(monthX + 65, monthY, monthX + 55, monthY + 10, monthX + 75, monthY + 10); //draw month incriment button
    triangle(monthX + 65, monthY + 25, monthX + 55, monthY + 15, monthX + 75, monthY + 15); //draw month decriment button
    if (overTri(monthX + 65, monthY + 25, monthX + 55, monthY + 15, monthX + 75, monthY + 15, mouseX, mouseY)) { //fill the incriment/decriment triangles grey when the mouse hovers over them
      fill(209,209,209);
      triangle(monthX + 65, monthY + 25, monthX + 55, monthY + 15, monthX + 75, monthY + 15);
      if (mousePressed) {
        monthInput--;
        triPressed = true;
      }
    }
    if (overTri(monthX + 65, monthY, monthX + 55, monthY + 10, monthX + 75, monthY + 10, mouseX, mouseY)) {
      fill(209,209,209);
      triangle(monthX + 65, monthY, monthX + 55, monthY + 10, monthX + 75, monthY + 10);
      if (mousePressed) {
        monthInput++;
        triPressed = true;
      }
    }
  }
  if (monthInput > 12 || monthInput < 1) {
    monthInput = 1;
  }
  if (triPressed) {
    fill(255);
    noStroke();
    rect(monthX + 5, monthY + 3, monthWidth - 10, monthHeight - 3);
    textSize(20);
    fill(0);
    text(monthInput, monthX + 10, monthY + 17);
  }
  if (keyPressed) {
    if (keyCode == ENTER) {
      dayNum = schoolYear[monthInput-1][dayInput];
    }
  }
}


void update() { //function responsible for updating p1-p4 strings with the correct class depending on the day number
  if (dayNum == 1) {
    p1 = "Comm. Tech" + p1Time;
    p2 = "Gym" + p2Time;
    p3 = "English" + p3Time;
    p4 = "Instrumental" + p4Time;
  }
  if (dayNum == 2) {
    p1 = "Science" + p1Time;
    p2 = "Computer Science" + p2Time;
    p3 = "French" + p3Time;
    p4 = "Math" + p4Time;
  }
  if (dayNum == 3) {
    p1 = "Instrumental" + p1Time;
    p2 = "Gym" + p2Time;
    p3 = "English" + p3Time;
    p4 = "Comm. Tech" + p4Time;
  }
  if (dayNum == 4) {
    p1 = "Math" + p1Time;
    p2 = "Computer Science" + p2Time;
    p3 = "French" + p3Time;
    p4 = "Science" + p4Time;
  }
  if (dayNum == 9) {
    p1 = "H";
    p2 = "H";
    p3 = "H";
    p4 = "H";
  }
}
void draw() { //loop
  s = second();  //update time variables to determine the day number and what period it is because draw function is a loop
  m = minute();
  h = hour();
  mon = month();
  d = day();
  background(255); //redraw background to prevent ghosting
  changeDate(); //call changeDate to check if someone pressed the button and change the day of the corresponding schedule
  update(); // call update to keep Schedule up to date
  textSize(32); //add text styling
  fill(0);
  smooth();
  if (!cButtonPressed) {
    dayNum = schoolYear[mon-1][d]; // gets daynumber from array using current month and day and updates it in the loop
    //as long as the change date button has not been pressed
  }
  if (dayNum == 9) { // tell the user it is holiday if dayNum = 9 because 9 represents holidays in the array
    text(hol, 10, 50);
  }else{
    text("Day " + dayNum, 10, 50);
  }
  text("Schedule:", 10, 120);
  //draw scheduele in the remaining canvas space
  textSize(30);
  text("Period 1: " + p1, 10, 190);
  text("Period 2: " + p2, 10, 290);
  text("Period 3: " + p3, 10, 390);
  text("Period 4: " + p4, 10, 490);
}
