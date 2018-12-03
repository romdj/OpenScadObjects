$fn = 1000;
module getBar(rad1, rad2, height = 20.0, width = 40.0, length = 400.0){
    
    difference(){
        cube([width, length, height], true);
        translate([0,0,-1])
            rotate([0,0,90])
                text("8/-8.5", .5, halign = "center", valign = "center");
        getCircle(rad1, height, width);
        getCircle(rad2, height, width, true);
    }
}

module getCircle(rad, height, width, reverse = false) {
    if(reverse){
        translate([-getCircleOffset(rad, width),0,-height/2])
            cylinder(height, r = rad, true);
    } else { 
        translate([getCircleOffset(rad, width),0,-height/2])
            cylinder(height, r = rad, true);
    }
}

function getCircleOffset(rad, width) = rad + width / 8;
function getCMFromFeet(ft) = ft * 304.8;

radius1 = getCMFromFeet(7);
radius2 = getCMFromFeet(7.5);
radius3 = getCMFromFeet(8);
radius4 = getCMFromFeet(8.5);
radius5 = getCMFromFeet(9);
radius6 = getCMFromFeet(9.5);

//feetCMRatio = 30.48;

barLength = 400;
getBar(radius3, radius4);


//cylinder(h = 2, r= 40, true);