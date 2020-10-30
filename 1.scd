(
var w,v;
var x_axis,y_axis,z_axis,circle;
var	r1,r2,r3,r4,r5,r6;
var  c_side_1,c_side_2,c_side_3,c_side_4,c_side_5,c_side_6;
var	p1_c,p2_c,p3_c,p4_c,p5_c,p6_c;
var	p1_radius,p2_radius,p3_radius,p4_radius,p5_radius,p6_radius;
var	p1_x,p1_y,p2_x,p2_y,p3_x,p3_y,p4_x,p4_y,p5_x,p5_y,p6_x,p56_y;
var	ch_0_1,ch_1_3,ch_3_4,ch_4_5,ch_5_6,ch_6_1;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("VBA_NestV",Rect(600,70,700,650),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 0.98;
    w.view.background = Color.white;
//////////////////////////////////////////////////////////////////////////////////////////////
    ~p1=Point(0,0);
	~p2=Point(0,0);
    ~p3=Point(0,0);
    ~p4=Point(0,0);
    ~p5=Point(0,0);
    ~p5=Point(0,0);
/////////////////////////////////////////////////////////////////////////////////////////////////////////
~slider1_a = Slider(w, Rect(50,520,15,100)).action_({arg obj;
	~angl = obj.value.linlin(0,1,1.5,7.83);
	~p1=Polar(~mang,~angl).asPoint;
});
~slider1_b=Slider(w, Rect(80,520,15,100)).action_({arg obj;
	~mang = obj.value.linlin(0,1,0,150);
	~p1=Polar(~mang,~angl).asPoint;
	v.refresh;
});
~slider2_a = Slider(w, Rect(150,520,15,100)).action_({arg obj;
	~angl = obj.value.linlin(0,1,1.5,7.83);
	~p2=Polar(~mang,~angl).asPoint;
});
~slider2_b=Slider(w, Rect(180,520,15,100)).action_({arg obj;
	~mang = obj.value.linlin(0,1,0,150);
	~p2=Polar(~mang,~angl).asPoint;
	v.refresh;
});
~slider3_a = Slider(w, Rect(250,520,15,100)).action_({
		arg obj;
	~angl = obj.value.linlin(0,1,1.5,7.83);
	~p3=Polar(~mang,~angl).asPoint;
});
~slider3_b=Slider(w, Rect(280,520,15,100)).action_({arg obj;
	~mang = obj.value.linlin(0,1,0,150);
	~p3=Polar(~mang,~angl).asPoint;
	v.refresh;
});
~slider4_a = Slider(w, Rect(350,520,15,100)).action_({
		arg obj;
	~angl = obj.value.linlin(0,1,1.5,7.83);
	~p4=Polar(~mang,~angl).asPoint;
});
~slider4_b=Slider(w, Rect(380,520,15,100)).action_({arg obj;
	~mang = obj.value.linlin(0,1,0,150);
	~p4=Polar(~mang,~angl).asPoint;
	v.refresh;
});
~slider5_a = Slider(w, Rect(450,520,15,100)).action_({arg obj;
	~angl = obj.value.linlin(0,1,1.5,7.83);
	~p5=Polar(~mang,~angl).asPoint;
});
~slider5_b=Slider(w, Rect(480,520,15,100)).action_({arg obj;
	~mang = obj.value.linlin(0,1,0,150);
	~p5=Polar(~mang,~angl).asPoint;
	v.refresh;
});
	~slider6_a = Slider(w, Rect(550,520,15,100)).action_({arg obj;
	~angl = obj.value.linlin(0,1,1.5,7.83);
	~p6=Polar(~mang,~angl).asPoint;
});
~slider6_b=Slider(w, Rect(580,520,15,100)).action_({arg obj;
	~mang = obj.value.linlin(0,1,0,150);
	~p6=Polar(~mang,~angl).asPoint;
	v.refresh;
});
~knob_z=Knob(w,Rect(600,380,38,38)).action_({arg obj;
	var theta_p1, theta_p2;
	theta_p1  =obj.value.linlin(0,1,0,6.28);   theta_p2 =obj.value.linlin(0,1,3.14,9.42);
	v.refresh;
	~p1_z = Polar(200,theta_p1).asPoint;   ~p2_z = Polar(200,theta_p2).asPoint;
});
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
v = UserView.new(w,Rect(12,12,500,500)).background_(Color.black);
   //(StaticText(v,Rect.aboutPoint(400@100,12,12)).string_("F").stringColor_(Color.white)).align = \center;
//	(StaticText(v,Rect.aboutPoint(100@100,12,12)).string_("L").stringColor_(Color.white)).align = \center;
//	(StaticText(v,Rect.aboutPoint(100@400,12,12)).string_("B").stringColor_(Color.white)).align = \center;
//	(StaticText(v,Rect.aboutPoint(400@400,12,12)).string_("R").stringColor_(Color.white)).align = \center;
//	StaticText(v,Rect(10,10,50,12)).string_("Grundriss").stringColor_(Color.white);
//	StaticText(v,Rect(452,245,10,12)).string_("0").background_(Color.white).align = \center;
//	StaticText(v,Rect(245,36,10,12)).string_("1").background_(Color.white).align = \center;
//	StaticText(v,Rect(245,245,10,12)).string_("2").background_(Color.white).align = \center;
//	StaticText(v,Rect(38,245,10,12)).string_("3").background_(Color.white).align = \center;
//	StaticText(v,Rect(245,452,10,12)).string_("4").background_(Color.white).align = \center;
//	(StaticText(v,Rect.aboutPoint(~p1,12,12)).string_("p1").stringColor_(Color.black)).align = \center;
  //  (StaticText(v,Rect.aboutPoint(~p2,12,12)).string_("p2").stringColor_(Color.black)).align = \center;
 //   (StaticText(v,Rect.aboutPoint(~p3,12,12)).string_("p3").stringColor_(Color.black)).align = \center;
 //   (StaticText(v,Rect.aboutPoint(~p4,12,12)).string_("p4").stringColor_(Color.black)).align = \center;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
v.drawFunc ={
	arg p1,p2,p3,p4,p5,p6;
    p1_radius=1;p2_radius=1;p3_radius=1;p4_radius=1;p5_radius=1;p6_radius=1;
	Pen.translate(250,250);
	/////C_matrix
    Color(red:1,green:0,blue:0,alpha:1).set;
	Pen.width=0.9;
	r1=Pen.line(0@0,~p1);r2=Pen.line(0@0,~p2);
	r3=Pen.line(0@0,~p3);r4=Pen.line(0@0,~p4);
	r5=Pen.line(0@0,~p5);r5=Pen.line(0@0,~p6);
	c_side_1=Pen.line(~p1,~p2);c_side_2=Pen.line(~p2,~p3);
	c_side_3=Pen.line(~p3,~p4);c_side_4=Pen.line(~p4,~p5);
	c_side_5=Pen.line(~p5,~p6);c_side_6=Pen.line(~p6,~p1);
	Pen.stroke;
	////_sides_and_sphere
	Color(red:1,green:1,blue:1,alpha:1).set;
   Pen.width=1;
//	ch_1_3=Pen.line(0@(-200),(-200)@0);ch_0_1=Pen.line(0@(-200),200@0);
//ch_3_4=Pen.line(0@200,(-200)@0);ch_4_5=Pen.line(0@200,200@0);
//	ch_5_0=Pen.line(0@200,(-200)@0);
y_axis=Pen.line(0@(-200),0@200);x_axis= Pen.line((-200)@0,200@0);z_axis= Pen.line(~p1_z,~p2_z );
//	circle=Pen.strokeOval(Rect.aboutPoint(0@0,200,200));
Pen.stroke;
	//////C_points
	Color(red:rrand(0.0, 1),green:rrand(0.0, 1),blue:rrand(0.0, 1),alpha:1).set;
	p1_c=Pen.fillOval(Rect.aboutPoint(~p1,p1_radius,p1_radius));
	p2_c=Pen.fillOval(Rect.aboutPoint(~p2,p2_radius,p2_radius));
	p3_c=Pen.fillOval(Rect.aboutPoint(~p3,p3_radius,p3_radius));
	p4_c=Pen.fillOval(Rect.aboutPoint(~p4,p4_radius,p4_radius));
	p5_c=Pen.fillOval(Rect.aboutPoint(~p5,p5_radius,p5_radius));
	p6_c=Pen.fillOval(Rect.aboutPoint(~p6,p6_radius,p6_radius));

	Pen.stroke;
};

)