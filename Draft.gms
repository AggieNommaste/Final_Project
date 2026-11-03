$onText
Bear River water basin is critical to the environment of northern Utah.
The basin is home to multiple reservoirs
and rivers which provide recreational space for people
and supplies water to the large agricultural industry in the bear river basin.
The river also provides water and habitat for the famous Bear River Migratory Bird Refuge.
Conserving the Bear River is one of the highest priorities for Northern Utah officials.
This paper aims to provide water management strategies to consumers and water managers in
the Cache Valley area to maximize water conservation for the stretch
of Bear River below Cache Valley and above the bird refuge through an optimization program.

------------Objective Function--------------

\max{\left(Z\right)}=\sum_{i\in \text{res}}^{ } X_{\text{rel},i}-\sum_{j\in \text{river}}^{ } X_{\text{irr},j}

---------------Constraints-------------
Constraint (units)  Equation
Reservoir storage capacity (acre-ft)    X_{sto,res}\leq S_{res}

River storage capacity (acre-ft)    X_{river}\leq S_{river}
Irrigation demand (acre-ft). D = demand X_{irr,river}\geq D_{irr}

Minimum reservoir level at each reservoir (acre-ft) X_{sto,res}\geq D_{res}

Mass balance at each reservoir (acre-ft). Inflow = I and Initial Level = L. I_{res}+L_{res_{0}} = X_{sto,res}+X_{rel,res}
Mass balance at each river (acre-ft). I = additional river inflow. Q = left over river flow X_{rel,res} + I_{river} = X_{irr,river}+Q_{river}
Minimum river flow for each river (acre-ft) Q_{river}\geq D_{river}
--------------------------------------


$offText

$onText
res1 = Hyrum Res
res2 = 1st Dam
res3 = Oneida
res4 = Malad
res5 = Cutler Res

j1 = Black Smith Fork
j2 = Cub river
j* = The junctions above the the reservoirs 

riv1 = Bear River
riv2 = Logan River
riv3 = Other river
$offText

Set
res The each reservoir being analyzed /res1*res5/
riv The rivers in the system /riv1*riv3/;


Parameters
res_capacity(res) The max capacity of each reservoir //
res_demand(res) The minium water level of each reservoir //
riv_capacity(riv) The capacity of each river //
irr_demand(riv) The irrigation demand from each river//
inflows_riv(riv) Additional inflows into each river (not including reservoir release) //
inflows_res(res) inflows for each reservoir//. 
riv_demand(riv) The minimum water demand for each river //
river_flow(riv) The flow in each river
init_res_sto(res) The initial res storage//
evapo(res) the evaporation of each river and reservoir //
ET(riv) Evapotranspiration for the rivers //;

Variables
refuge_flow The value of the objective function; 

Positive Variables
X_sto(res) how much water to store at each reservoir
X_irr(riv) how much water to irrigate from each river
X_rel(res) how much water to release at each reservoir;


Equations
obj The objective function
res_stor_constraint(res) The constraint of the max reservoir storage
res_min_constraint(res) the minimum res level constraint
riv_stor_constraint(riv) The constraint of the max river storage
riv_min_constraint(riv) The min river base flow
irr_constraint(riv) the irrigation demand constraint
mass_balance_res(res) The mass balance constraint for reservoirs
mass_balance_riv(riv) The mass balance constraint for rivers;


obj.. refuge_flow =E= sum(res, X_rel(res)) - sum(riv, X_irr(riv));
res_stor_constraint(res).. X_sto(res) =L= res_capacity(res);
res_min_constraint(res).. X_sto(res) =G= res_demand(res);
riv_stor_constraint(riv).. river_flow(riv) =L= riv_capacity(riv);
riv_min_constraint(riv).. river_flow(riv) =G= riv_demand(riv);
irr_constraint(riv).. X_irr(riv) =G= irr_demand(riv);
mass_balance_res(res).. init_res_sto(res) + inflow_res(res) =E= X_sto(res) + X_rel(res) + evapo(res);
*make equation that assignes X_rel(res) to corresponding river_inflow(riv)
mass_balance_riv(riv).. river_inflow(riv) + inflow_riv(riv) =G= ET(riv) + X_irr(riv) 






