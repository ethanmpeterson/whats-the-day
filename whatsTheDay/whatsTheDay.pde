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
String hol; // holiday
String p1;
String p2;
String p3;
String p4;

void setup() { //code runs once
size(400, 700);
noStroke();
rect(0, 0, 400, 700);
hol = "Day is a Holiday!";
}
void update() { //function responsible for updating p1-p4 strings with the correct class depending on the day number
  if (dayNum == 1) {
    p1 = "Comm. Tech";
    p2 = "Gym";
    p3 = "English";
    p4 = "Instrumental";
  }
  if (dayNum == 2) {
    p1 = "Science";
    p2 = "Computer Science";
    p3 = "French";
    p4 = "Math";
  }
  if (dayNum == 3) {
    p1 = "Instrumental";
    p2 = "Gym";
    p3 = "English";
    p4 = "Comm. Tech";
  }
  if (dayNum == 4) {
    p1 = "Math";
    p2 = "Computer Science";
    p3 = "French";
    p4 = "Science";
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
  background(255);
  update(); // call update to keep Schedule up to date
  textSize(32); //add text styling
  fill(0);
  smooth();
  dayNum = schoolYear[mon-1][d]; // gets daynumber from array using current month and day and updates it in the loop
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
