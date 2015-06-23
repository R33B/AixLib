within AixLib.HVAC.HeatGeneration;
package Examples
  extends Modelica.Icons.ExamplesPackage;
  model Test_HeatPump

   extends Modelica.Icons.Example;
    Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=1000)
      annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
    Modelica.Fluid.Sources.MassFlowSource_T sourceSideMassFlowSource(
      use_T_in=true,
      redeclare package Medium =
          Modelica.Media.Water.ConstantPropertyLiquidWater,
      m_flow=1,
      T=275.15,
      nPorts=1) annotation (Placement(transformation(extent={{-44,4},{-24,24}})));

    Modelica.Fluid.Sources.FixedBoundary sourceSideFixedBoundary(redeclare
        package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
        nPorts=1)
            annotation (Placement(transformation(extent={{-46,-18},{-26,2}})));
    Modelica.Fluid.Sources.FixedBoundary sinkSideFixedBoundary(redeclare
        package Medium =
                 Modelica.Media.Water.ConstantPropertyLiquidWater, nPorts=1)
      annotation (Placement(transformation(extent={{96,4},{76,24}})));
    Modelica.Fluid.Sources.MassFlowSource_T sinkSideMassFlowSource(
      redeclare package Medium =
          Modelica.Media.Water.ConstantPropertyLiquidWater,
      m_flow=0.5,
      use_m_flow_in=true,
      T=308.15,
      nPorts=1) annotation (Placement(transformation(extent={{20,-58},{40,-38}})));

    inner Modelica.Fluid.System system
      annotation (Placement(transformation(extent={{64,80},{84,100}})));
    Modelica.Blocks.Sources.Ramp TsuSourceRamp(
      duration=1000,
      startTime=1000,
      height=25,
      offset=278)
      annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
    Modelica.Blocks.Sources.Pulse massFlowPulse(
      amplitude=0.5,
      period=1000,
      offset=0,
      startTime=0,
      width=51)
      annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
    Modelica.Fluid.Sensors.TemperatureTwoPort temperature(redeclare package
        Medium = Modelica.Media.Water.ConstantPropertyLiquidWater)
      annotation (Placement(transformation(extent={{42,4},{62,24}})));
    Modelica.Blocks.Interfaces.RealOutput Pel
      annotation (Placement(transformation(extent={{100,-20},{120,0}})));
    Modelica.Blocks.Interfaces.RealOutput T_Co_out
      "Temperature of the passing fluid"
      annotation (Placement(transformation(extent={{100,40},{120,60}})));
    HeatPump.HeatPump heatPump(
      redeclare package Medium_con =
          Modelica.Media.Water.ConstantPropertyLiquidWater,
      redeclare package Medium_eva =
          Modelica.Media.Water.ConstantPropertyLiquidWater,
      CorrFlowCo=true,
      CorrFlowEv=true,
      P_eleOutput=true)
      annotation (Placement(transformation(extent={{-6,0},{24,20}})));
  equation
    connect(TsuSourceRamp.y, sourceSideMassFlowSource.T_in) annotation (Line(
        points={{-59,10},{-54,10},{-54,18},{-46,18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(massFlowPulse.y, sinkSideMassFlowSource.m_flow_in) annotation (Line(
        points={{-59,-50},{20,-50},{20,-40}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sinkSideFixedBoundary.ports[1], temperature.port_b) annotation (Line(
        points={{76,14},{62,14}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(temperature.T, T_Co_out) annotation (Line(
        points={{52,25},{52,50},{110,50}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(heatPump.P_eleOut, Pel) annotation (Line(
        points={{4,1},{4,-10},{110,-10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(booleanPulse.y, heatPump.onOff_in) annotation (Line(
        points={{-59,50},{4,50},{4,19}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(sourceSideMassFlowSource.ports[1], heatPump.port_evaIn) annotation
      (Line(
        points={{-24,14},{-14,14},{-14,17},{-4,17}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(sourceSideFixedBoundary.ports[1], heatPump.port_evaOut) annotation
      (Line(
        points={{-26,-8},{-12,-8},{-12,3},{-4,3}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(heatPump.port_conOut, temperature.port_a) annotation (Line(
        points={{22,17},{28,17},{28,14},{42,14}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(heatPump.port_conIn, sinkSideMassFlowSource.ports[1]) annotation (
        Line(
        points={{22,3},{36,3},{36,-18},{50,-18},{50,-48},{40,-48}},
        color={0,127,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics),
      experiment(StopTime=3600),
      __Dymola_experimentSetupOutput,
      Documentation(info="<html>
<p><h4><font color=\"#008000\">Overview</font></h4></p>
<p>
Simple test set-up for the HeatPump model. The heat pump is turned on and off while the source temperature increases linearly. Outputs are the electric power consumptiion of the heat pump and the supply temperature.
</p>
</html>",
        revisions="<html>
<p><ul>
<li><i>December 10, 2013&nbsp;</i> by Ole Odendahl:<br/>Formatted documentation appropriately</li>
</ul></p>
</html>
"));
  end Test_HeatPump;
end Examples;