// Units are in mm

//color("black")
$fn=150;
caseHeight = 300;
caseThickness = 100;
caseLength = 622;
seatTubeAngle = 73.0;

wheelDiameter = 622;
wheelCaseHeightMargin = 30;
wheelCaseThicknessMargin = 30;


mac15Length=358.9;
mac15Height=247.1;
mac15Thickness=18.0;

 module macbook(){
     color("silver")cube([mac15Length, mac15Height, mac15Thickness]);
 }
module main(){          
    difference() {
        difference() {

                cube([caseLength, caseHeight,caseThickness]);
            translate([caseLength/2, - 9*caseHeight/10 , caseThickness / 2])
                rotate ([0,0,90])
minkowski(){
                    cylinder(
                        h = wheelCaseThicknessMargin,
                        r = wheelDiameter/2 + wheelCaseHeightMargin,
                        center = true
                    );

    sphere(r=wheelCaseThicknessMargin/4);
    }        }
        translate([caseHeight/tan(seatTubeAngle),caseHeight,0])
        rotate([-90,-90,180])
            prism(caseThickness, caseHeight/tan(seatTubeAngle), caseHeight);    
    }
}
// translate([-358.9 * 2, 0, 0]) macbook();
//minkowski() {

main();
//    sphere(r=30);
  //  }



module prism(l, w, h){
       polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
       /*
       // preview unfolded (do not include in your function
       z = 0.08;
       separation = 2;
       border = .2;
       translate([0,w+separation,0])
           cube([l,w,z]);
       translate([0,w+separation+w+border,0])
           cube([l,h,z]);
       translate([0,w+separation+w+border+h+border,0])
           cube([l,sqrt(w*w+h*h),z]);
       translate([l+border,w+separation+w+border+h+border,0])
           polyhedron(
                   points=[[0,0,0],[h,0,0],[0,sqrt(w*w+h*h),0], [0,0,z],[h,0,z],[0,sqrt(w*w+h*h),z]],
                   faces=[[0,1,2], [3,5,4], [0,3,4,1], [1,4,5,2], [2,5,3,0]]
                   );
       translate([0-border,w+separation+w+border+h+border,0])
           polyhedron(
                   points=[[0,0,0],[0-h,0,0],[0,sqrt(w*w+h*h),0], [0,0,z],[0-h,0,z],[0,sqrt(w*w+h*h),z]],
                   faces=[[1,0,2],[5,3,4],[0,1,4,3],[1,2,5,4],[2,0,3,5]]
                   );
       */
}

