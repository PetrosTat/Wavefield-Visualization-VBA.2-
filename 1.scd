(
var w,v;
var x_axis,y_axis,z_axis,circle;
var	r1,r2,r3,r4,r5,r6;
var  c_side_1,c_side_2,c_side_3,c_side_4,c_side_5,c_side_6;
var	p1_c,p2_c,p3_c,p4_c,p5_c,p6_c;
var  p1,p2,p3,p4,p5,p6;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    Window.closeAll;
    w = Window("VBA_NestV",Rect(600,70,660,650),scroll:false).front.alwaysOnTop_(true);
    w.alpha = 0.98;  w.view.background = Color.white;
//////////////////////////////////////////////////////////////////////////////////////////////
    ~p1=Point(0,0);~p2=Point(0,0); ~p3=Point(0,0);
    ~p4=Point(0,0); ~p5=Point(0,0);  ~p6=Point(0,0);
    ~p1_radius = 10;~p2_radius = 10;~p3_radius = 10;~p4_radius = 10;~p5_radius = 10;~p6_radius = 10;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
~slider1 = Slider2D(w, Rect(15,520,80,100)).action_({
		arg obj;   var mang, angl;  angl = obj.x.linlin(0,1,0,6.28); mang = obj.y.linlin(0,1,0,150);
	 ~p1=Polar(mang,angl).asPoint;  v.refresh;
	});
~slider2 = Slider2D(w, Rect(110,520,80,100)).action_({
		arg obj;   var mang, angl;	angl = obj.x.linlin(0,1,0,6.28); mang = obj.y.linlin(0,1,0,150);
	~p2=Polar(mang,angl).asPoint;  v.refresh;
	});
~slider3 = Slider2D(w, Rect(205,520,80,100)).action_({
		arg obj;   var mang, angl;  angl = obj.x.linlin(0,1,0,6.28); mang = obj.y.linlin(0,1,0,150);
	~p3=Polar(mang,angl).asPoint;  v.refresh;
	});
~slider4 = Slider2D(w, Rect(300,520,80,100)).action_({
		arg obj;   var mang, angl; angl = obj.x.linlin(0,1,0,6.28); mang = obj.y.linlin(0,1,0,150);
	~p4=Polar(mang,angl).asPoint;  v.refresh;
	});
~slider5 = Slider2D(w, Rect(395,520,80,100)).action_({
		arg obj;   var mang, angl;  angl = obj.x.linlin(0,1,0,6.28); mang = obj.y.linlin(0,1,0,150);
	~p5=Polar(mang,angl).asPoint;  v.refresh;
	});
~slider6 = Slider2D(w, Rect(490,520,80,100)).action_({
		arg obj;   var mang, angl;  angl = obj.x.linlin(0,1,0,6.28); mang = obj.y.linlin(0,1,0,150);
	~p6=Polar(mang,angl).asPoint;  v.refresh;
	});
////////////////////////////////////////////////////////////////points
~knob_z=Knob(w,Rect(585,550,50,50)).action_({arg obj;
	var theta_p1, theta_p2;
	theta_p1  =obj.value.linlin(0,1,0,6.28);   theta_p2 =obj.value.linlin(0,1,3.14,9.42);
	v.refresh;
	~p1_z = Polar(200,theta_p1).asPoint;   ~p2_z = Polar(200,theta_p2).asPoint;
});
///////////////////////////////////////////////////////////////waves
~slider7 = Slider(w, Rect(550,15,80,30)).action_({
		arg obj;
	~p1_radius = obj.value.linlin(0,1,1,200);
	v.refresh;
	});
~slider8 = Slider(w, Rect(550,70,80,30)).action_({
		arg obj;
	~p2_radius = obj.value.linlin(0,1,1,200);
	v.refresh;
	});
~slider9 = Slider(w, Rect(550,125,80,30)).action_({
		arg obj;
	~p3_radius = obj.value.linlin(0,1,1,200);
	v.refresh;
	});
~slider10 = Slider(w, Rect(550,180,80,30)).action_({
		arg obj;
	~p4_radius = obj.value.linlin(0,1,1,200);
	v.refresh;
	});
~slider11 = Slider(w, Rect(550,235,80,30)).action_({
		arg obj;
	~p5_radius = obj.value.linlin(0,1,1,200);
	v.refresh;
	});
~slider12 = Slider(w, Rect(550,290,80,30)).action_({
		arg obj;
	~p6_radius = obj.value.linlin(0,1,1,200);
	v.refresh;
	});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
v = UserView.new(w,Rect(12,12,500,500)).background_(Color.gray);
   //(StaticText(v,Rect.aboutPoint(400@100,12,12)).string_("F").stringColor_(Color.white)).align = \center;
//	StaticText(v,Rect(452,245,10,12)).string_("0").background_(Color.white).align = \center;
//	(StaticText(v,Rect.aboutPoint(~p1,12,12)).string_("p1").stringColor_(Color.black)).align = \center;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
v.drawFunc ={
	Pen.translate(250,250);
	/////C_matrix
    Color(red:1,green:0,blue:0,alpha:0.5).set;
	Pen.width=0.5;
	r1=Pen.line(0@0,~p1);r2=Pen.line(0@0,~p2);
	r3=Pen.line(0@0,~p3);r4=Pen.line(0@0,~p4);
	r5=Pen.line(0@0,~p5);r5=Pen.line(0@0,~p6);
	c_side_1=Pen.line(~p1,~p2);c_side_2=Pen.line(~p2,~p3);
	c_side_3=Pen.line(~p3,~p4);c_side_4=Pen.line(~p4,~p5);
	c_side_5=Pen.line(~p5,~p6);c_side_6=Pen.line(~p6,~p1);
	Pen.stroke;
	////_sides_and_sphere
	Color(red:0,green:0,blue:0,alpha:0.8).set;
   Pen.width=1/2;
y_axis=Pen.line(0@(-200),0@200);x_axis= Pen.line((-200)@0,200@0);z_axis= Pen.line(~p1_z,~p2_z );
//	circle=Pen.strokeOval(Rect.aboutPoint(0@0,200,200));
Pen.stroke;
	//////C_points
	Color(red:0,green:1,blue:1,alpha:0.5).set;
	Pen.width=4/3;
	p1_c=Pen.addOval(Rect.aboutPoint(~p1,~p1_radius,~p1_radius));
	p2_c=Pen.addOval(Rect.aboutPoint(~p2,~p2_radius,~p2_radius));
	p3_c=Pen.addOval(Rect.aboutPoint(~p3,~p3_radius,~p3_radius));p4_c=Pen.addOval(Rect.aboutPoint(~p4,~p4_radius,~p4_radius));
	p5_c=Pen.addOval(Rect.aboutPoint(~p5,~p5_radius,~p5_radius));p6_c=Pen.addOval(Rect.aboutPoint(~p6,~p6_radius,~p6_radius));
	Pen.width=3/2;
	p1=Pen.addRect(Rect.aboutPoint(~p1,2,2));p2=Pen.addRect(Rect.aboutPoint(~p2,2,2));p3=Pen.addRect(Rect.aboutPoint(~p3,2,2));
	p4=Pen.addRect(Rect.aboutPoint(~p4,2,2));p5=Pen.addRect(Rect.aboutPoint(~p5,2,2));p6=Pen.addRect(Rect.aboutPoint(~p6,2,2));

	Pen.stroke;
};

)