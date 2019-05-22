//var unit = "mm";
$fn = 100;



module mainOffset() {
    height = 100;
    thickness = 1;
    width = 55;
    linear_extrude(height=height)
    {
        offset(r=1){
            square([thickness,height],0);
            translate([width,0,0])square([thickness,height],0);
            translate([0,height,0])rotate([0,0,-90])square([thickness,width],0);
        }
    }
}


module mainCurveMink() {
    height = 100;
    thickness = 5;
    width = 55;
//    linear_extrude(height=height){ 
        /*offset (r = 1){*/
    difference(){
    minkowski(){    
    cube([width,height,height],0);
        cylinder(r=5,h=1);
    }
    translate([-2,10,height/2]){
        minkowski(){    
            cube([width - 10,height*1.5,height],0);
            cylinder(r=5,h=1);
        }
    }
//        cube([width,width,width],0);
//        translate([width,0,0])square([thickness,height],0);
//        translate([0,height,0])rotate([0,0,-90])square([thickness,width],0);
    }
}

module mainAsymetrical() {
    height = 100;
    otherSideHeight = height/3;
    thickness = 1;
    width = 55;
    linear_extrude(height=height){ 
        square([thickness,height],0);
        translate([width,height,0])rotate([180,0,0])square([thickness,otherSideHeight],0);
        translate([0,height,0])rotate([0,0,-90])square([thickness,width],0);
    }
}
translate([-500,0,0])main();
mainCurveMink();
translate([500,0,0])mainAsymetrical();