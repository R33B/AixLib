within AixLib.Fluid.HeatExchangers.Radiators.BaseClasses;
class Radiator_wall "Simple one layer wall"
  import BaseLib;

  parameter Modelica.SIunits.Thickness d=0.025 "Thickness"
    annotation (Dialog(group="Structure"));
  parameter Modelica.SIunits.ThermalConductivity lambda=2.4
    "Thermal conductivity" annotation (Dialog(group="Structure"));
  parameter Modelica.SIunits.HeatCapacity C "heat capacity of radiator wall";
  parameter Modelica.SIunits.SpecificHeatCapacity c=1000
    "Specific heat capacity" annotation (Dialog(group="Structure"));
  parameter Modelica.SIunits.Temperature T0=Modelica.SIunits.Conversions.from_degC(16)
    "Initial temperature" annotation (Dialog(group="Thermal"));
  parameter Modelica.SIunits.Area A=0.8 "Area of radiator surface";
  parameter Modelica.SIunits.ThermalConductance G=lambda*A/d;

  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(
                                                            C=C)
    annotation (Placement(transformation(
        origin={-6,-62},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor
    thermalConductor(                                             G=G/2)
    annotation (Placement(transformation(extent={{-56,-30},{-36,-10}},
          rotation=0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor
    thermalConductor1(                                             G=G/2)
    annotation (Placement(transformation(extent={{32,-30},{52,-10}},
          rotation=0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a
    annotation (Placement(transformation(extent={{-104,-8},{-84,12}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b
    annotation (Placement(transformation(extent={{84,-10},{104,10}})));
equation
  connect(port_a, thermalConductor.port_a) annotation (Line(
      points={{-94,2},{-73,2},{-73,-20},{-56,-20}},
      color={191,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(thermalConductor.port_b, heatCapacitor.port) annotation (Line(
      points={{-36,-20},{-6,-20},{-6,-52}},
      color={191,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(thermalConductor.port_b, thermalConductor1.port_a) annotation (Line(
      points={{-36,-20},{32,-20}},
      color={191,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(thermalConductor1.port_b, port_b) annotation (Line(
      points={{52,-20},{71,-20},{71,0},{94,0}},
      color={191,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  annotation (Diagram(graphics),
                       Icon(graphics={
        Rectangle(
          extent={{-80,60},{-50,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-50,60},{-20,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-20,60},{20,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{20,60},{50,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{50,60},{80,-100}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid)}),
    Documentation(revisions="<html>
<p><ul>
<li><i>October 7, 2013&nbsp;</i> by Ole Odendahl:<br/>Added documentation and formatted appropriately</li>
</ul></p>
</html>
", info=
    "<html>
<p><h4><font color=\"#008000\">Overview</font></h4></p>
<p>Simple one layer wall for a radiator</p>
<p><h4><font color=\"#008000\">Level of Development</font></h4></p>
<p><img src=\"modelica://HVAC/Images/stars2.png\"/></p>
</html>"));
end Radiator_wall;