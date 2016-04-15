within AixLib.DataBase.HeatPump.EN255;
record Vitocal350AWI114 "Vitocal 350 AWI 114"
  import HVAC;
  extends HeatPumpBaseDataDefinition(
    table_Pel=[0,-20,-15,-10,-5,0,5,10,15,20,25,30; 35,3295.50000000000,
        3522.70000000000,3750,3977.30000000000,4034.10000000000,
        4090.90000000000,4204.50000000000,4375,4488.60000000000,
        4488.60000000000,4545.50000000000; 50,4659.10000000000,4886.40000000000,
        5113.60000000000,5227.30000000000,5511.40000000000,5568.20000000000,
        5738.60000000000,5909.10000000000,6022.70000000000,6250,
        6477.30000000000; 65,0,6875,7159.10000000000,7500,7727.30000000000,
        7897.70000000000,7954.50000000000,7954.50000000000,8181.80000000000,
        8409.10000000000,8579.50000000000],
    table_Qdot_Co=[0,-20,-15,-10,-5,0,5,10,15,20,25,30; 35,9204.50000000000,
        11136.4000000000,11477.3000000000,12215.9000000000,13863.6000000000,
        15056.8000000000,16931.8000000000,19090.9000000000,21250,
        21477.3000000000,21761.4000000000; 50,10795.5000000000,11988.6000000000,
        12215.9000000000,13068.2000000000,14545.5000000000,15681.8000000000,
        17613.6000000000,20284.1000000000,22500,23181.8000000000,
        23863.6000000000; 65,0,12954.5000000000,13465.9000000000,
        14431.8000000000,15965.9000000000,17386.4000000000,19204.5000000000,
        21250,22897.7000000000,23863.6000000000,24886.4000000000],
    mFlow_Co_nom=15400/4180/10,
    mFlow_Ev_nom=1);

  annotation(preferedView="text", DymolaStoredErrors,
    Icon,
    Documentation(info="<html>
<p><h4><font color=\"#008000\">Overview</font></h4></p>
<p>
Data from manufacturer's data sheet (Viessmann). These curves are given in the data sheet for measurement procedure according to EN 255.
</p>
<p><h4><font color=\"#008000\">Level of Development</font></h4></p>
<p><img src=\"modelica://HVAC/Images/stars3.png\"/></p>
<p><h4><font color=\"#008000\">References</font></h4></p>
<p>
EN 255
</p>
</html>",
      revisions="<html>
<p><ul>
<li><i>December 10, 2013&nbsp;</i> by Ole Odendahl:<br/>Formatted documentation appropriately</li>
</ul></p>
</html>
"));
end Vitocal350AWI114;