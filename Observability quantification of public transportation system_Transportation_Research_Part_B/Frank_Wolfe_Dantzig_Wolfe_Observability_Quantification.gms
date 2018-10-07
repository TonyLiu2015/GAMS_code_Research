$ title observability quantification of dynamic transit system_Jiangtao_Liu

option LP=CPLEX;

set i nodes /1*8/;
set t time stamp /0*11/;
set a group /1*28/;
set pie time period /1*2/;
alias (i, j);
alias (t, s);

parameter c(i,j,t,s) link travel cost /
1.7.0.3 3
7.4.3.4 1
4.6.4.6 2
1.6.0.8 8
2.7.0.3 3
2.5.0.4 4
5.6.4.7 3
3.8.0.3 3
8.5.3.4 1
3.6.0.8 8
1.7.3.6 3
7.4.6.7 1
4.6.7.9 2
1.6.3.11 8
2.7.3.6 3
2.5.3.7 4
5.6.7.10 3
3.8.3.6 3
8.5.6.7 1
3.6.3.11 8
6. 6. 6. 7 0
6. 6. 7. 8 0
6. 6. 8. 9 0
6. 6. 9. 10 0
6. 6. 10. 11 0
/;

parameter net(i,j,t,s) link indicator /
1.7.0.3 3
7.4.3.4 1
4.6.4.6 2
1.6.0.8 8
2.7.0.3 3
2.5.0.4 4
5.6.4.7 3
3.8.0.3 3
8.5.3.4 1
3.6.0.8 8
1.7.3.6 3
7.4.6.7 1
4.6.7.9 2
1.6.3.11 8
2.7.3.6 3
2.5.3.7 4
5.6.7.10 3
3.8.3.6 3
8.5.6.7 1
3.6.3.11 8
6. 6. 6. 7 1
6. 6. 7. 8 1
6. 6. 8. 9 1
6. 6. 9. 10 1
6. 6. 10. 11 1
/;

parameter Cap(i,j,t,s) link capacity /
1.7.0.3 3
7.4.3.4 99
4.6.4.6 6
1.6.0.8 2
2.7.0.3 3
2.5.0.4 4
5.6.4.7 4
3.8.0.3 3
8.5.3.4 99
3.6.0.8 2
1.7.3.6 4
7.4.6.7 99
4.6.7.9 8
1.6.3.11 3
2.7.3.6 4
2.5.3.7 6
5.6.7.10 6
3.8.3.6 4
8.5.6.7 99
3.6.3.11 3
6. 6. 6. 7 99
6. 6. 7. 8 99
6. 6. 8. 9 99
6. 6. 9. 10 99
6. 6. 10. 11 99
/;

parameter beta_1;
beta_1 =2.36;

parameter beta_2;
beta_2 =0.31;

parameter group_trip_time(a)/
1 6
2 7
3 8
4 6.5
5 7
6 7.5
7 6.5
8 6
9 7
10 7.5
11 8
12 6
13 7
14 6.5
15 7.5
16 7
17 8
18 6
19 7
20 6.5
21 7.5
22 8
23 6.8
24 7
25 7.5
26 7.4
27 7.8
28 8
/;

parameter time_p(pie,t,s)  /
1. 3. 4 1
2. 6. 7 1
/;

parameter cout(i,j,pie)  /
7. 4. 1 4.5
7. 4. 2 8.1
/;

parameter group_d(a)/
1 1
2 1
3 1
4 1
5 1
6 1
7 1
8 1
9 1
10 1
11 1
12 1
13 1
14 1
15 1
16 1
17 1
18 1
19 1
20 1
21 1
22 1
23 1
24 1
25 1
26 1
27 1
28 1
/;

parameter origin(a,i,t) /
1.1.0 1
2.1.0 1
3.1.0 1
4.1.0 1
5.2.0 1
6.2.0 1
7.2.0 1
8.2.0 1
9.3.0 1
10.3.0 1
11.3.0 1
12.1.3 1
13.1.3 1
14.1.3 1
15.1.3 1
16.1.3 1
17.1.3 1
18.2.3 1
19.2.3 1
20.2.3 1
21.2.3 1
22.2.3 1
23.2.3 1
24.3.3 1
25.3.3 1
26.3.3 1
27.3.3 1
28.3.3 1
/;

parameter destination(a,i,t) /
1.6.11 1
2.6.11 1
3.6.11 1
4.6.11 1
5.6.11 1
6.6.11 1
7.6.11 1
8.6.11 1
9.6.11 1
10.6.11 1
11.6.11 1
12.6.11 1
13.6.11 1
14.6.11 1
15.6.11 1
16.6.11 1
17.6.11 1
18.6.11 1
19.6.11 1
20.6.11 1
21.6.11 1
22.6.11 1
23.6.11 1
24.6.11 1
25.6.11 1
26.6.11 1
27.6.11 1
28.6.11 1
/;

parameter intermediate(a,i,t);
intermediate(a,i,t) = (1- origin(a,i,t))* (1- destination(a,i,t));

variable z_initial;
positive variables
x(a,i,j,t,s )  selection of  comm a between i,t and j,s;

equations
obj_initial
comm_flow_on_node_origin(a,i,t)         origin node flow a on node i at time t
comm_flow_on_node_intermediate(a,i,t)   intermediate node flow a on node i at time t
comm_flow_on_node_destination(a,i,t)      destination node flow a on node i at time t
cap_constraint(i,j,t,s)
;

obj_initial.. z_initial =e= sum(a,sum((i,j,t,s)$(net(i,j,t,s)>0.1), x(a,i,j,t,s)*c(i,j,t,s)));
comm_flow_on_node_origin(a,i,t)$(origin(a,i,t)>0.1) .. sum((j,s)$(net(i,j,t,s)>0.1), x(a,i,j,t,s)) =e= origin(a,i,t);
comm_flow_on_node_destination(a,i,t)$(destination(a,i,t)>0.1) ..  sum((j,s)$(net(j,i,s,t)>0.1), x(a,j,i,s,t))=e= destination(a,i,t);
comm_flow_on_node_intermediate(a,i,t)$(intermediate(a,i,t)>0.1).. sum((j,s)$(net(i,j,t,s)>0.1), x(a,i, j, t,s))-sum((j,s)$(net(j,i,s,t)>0.1), x(a,j,i,s,t))=e= 0;
cap_constraint(i,j,t,s)$(net(i,j,t,s)>0.1).. Cap(i,j,t,s)-sum(a,x(a,i,j,t,s)) =g=0;

Model transit_initial /obj_initial,comm_flow_on_node_origin,comm_flow_on_node_destination,comm_flow_on_node_intermediate,cap_constraint/;

solve transit_initial using LP minimizing z_initial;

parameter f(i,j,t,s);
f(i,j,t,s) = sum(a,x.l(a,i,j,t,s));
display f;

parameter est_group_time(a);
est_group_time(a)= sum((i,j,t,s)$(net(i,j,t,s)>0.1), x.l(a,i,j,t,s )*c(i,j,t,s));
display est_group_time;

parameter est_cout(i,j,pie);
est_cout(i,j,pie)$(cout(i,j,pie)>0.1)=sum((t,s)$(time_p(pie,t,s)=1),sum(a,x.l(a,i,j,t,s)));
display est_cout;

parameter TT(a);
TT(a) = sum((i,j,t,s)$(net(i,j,t,s)>0.1), x.l(a,i,j,t,s)*c(i,j,t,s));
display TT;

parameter Z_total;
Z_total = sum(a,sum((i,j,t,s)$(net(i,j,t,s)>0.1), x.l(a,i,j,t,s )*c(i,j,t,s)));
display Z_total;

display x.l;
display z_initial.l;

**---------------------------Frank-Wolfe algorithm-------------------------**

parameter delta(a);
parameter gama(i,j,pie);

variable z_lp;

equations
obj_lp
;
obj_lp..  z_lp =e= beta_1*sum(a,sum((i,j,t,s)$(net(i,j,t,s)>0.1),delta(a)*c(i,j,t,s)*x(a,i,j,t,s)))+ beta_2*sum((i,j,pie)$(cout(i,j,pie)>0.1),gama(i,j,pie)*sum((t,s)$(time_p(pie,t,s)=1),sum(a,x(a,i,j,t,s))));

Model transit_lp /obj_lp,comm_flow_on_node_origin,comm_flow_on_node_destination,comm_flow_on_node_intermediate,cap_constraint/;

sets  iter  iteration index / iter1 * iter20/;
set m /1*21/;

positive variable step_size(m);

variable z_step;

variable r(m,a,i,j,t,s);
parameter k(m);
k('1') = 1;
display k;

parameter subgradient

parameter n;
n = 1;

* y is the x_k in FW algorithm (initialization)
parameter y(m,a,i,j,t,s);
y('1',a,i,j,t,s)=x.l(a,i,j,t,s);

display y;

equations
obj_step
step_bound
inter_var(m,a,i,j,t,s)
;
obj_step..  z_step =e= sum(m$(k(m)=n),(beta_1*sum(a,((sum((i,j,t,s)$(net(i,j,t,s)>0.1), r(m,a,i,j,t,s )*c(i,j,t,s))-group_d(a)*group_trip_time(a)))*(sum((i,j,t,s)$(net(i,j,t,s)>0.1), r(m,a,i,j,t,s )*c(i,j,t,s))-group_d(a)*group_trip_time(a)))+beta_2*sum((i,j,pie)$(cout(i,j,pie)>0.1),(sum((t,s)$(time_p(pie,t,s)=1),sum(a,r(m,a,i,j,t,s)))-cout(i,j,pie))*(sum((t,s)$(time_p(pie,t,s)=1),sum(a,r(m,a,i,j,t,s)))-cout(i,j,pie)))));
step_bound(m)$(k(m)=n).. step_size(m)=l=1;
inter_var(m,a,i,j,t,s)$(k(m)=n).. r(m,a,i,j,t,s)=e= y(m,a,i,j,t,s)+step_size(m)*subgradient(m,a,i,j,t,s);

Model step_opt/obj_step,step_bound,inter_var/;

parameter total_new;
parameter total_deviation;

loop(iter,

         delta(a)=sum(m$(k(m)=n),2*(sum((i,j,t,s)$(net(i,j,t,s)>0.1), y(m,a,i,j,t,s )*c(i,j,t,s))-group_d(a)*group_trip_time(a)));
         gama(i,j,pie)$(cout(i,j,pie)>0.1)= sum(m$(k(m)=n),(2*sum((t,s)$(time_p(pie,t,s)=1),sum(a,y(m,a,i,j,t,s)))-cout(i,j,pie)));
         display delta;
         display gama;

         solve transit_lp using LP minimizing z_lp;

* the subgradient is s_k-x_k
         subgradient(m,a,i,j,t,s)$(k(m)=n)= x.l(a,i,j,t,s)-y(m,a,i,j,t,s);
         display subgradient;

* find the optimal step size
         solve step_opt using NLP minimizing z_step;
         display step_size.l;
         display z_step.l;

         n = n +1;
*update k(m) to ensure at the next iteration we just focus on the new x_k
         k(m)=k(m-1)+1;
         display k;

         y(m,a,i,j,t,s)$(k(m)=n)= y(m-1,a,i,j,t,s)+step_size.l(m-1)*subgradient(m-1,a,i,j,t,s);
         display y;

         total_new=sum(m$(k(m)=n),sum(a,sum((i,j,t,s)$(net(i,j,t,s)>0.1), y(m,a,i,j,t,s )*c(i,j,t,s))));
         display total_new;

         total_deviation=sum(m$(k(m)=n), beta_1*sum(a,((sum((i,j,t,s)$(net(i,j,t,s)>0.1), y(m,a,i,j,t,s )*c(i,j,t,s))-group_d(a)*group_trip_time(a)))*(sum((i,j,t,s)$(net(i,j,t,s)>0.1), y(m,a,i,j,t,s )*c(i,j,t,s))-group_d(a)*group_trip_time(a)))+beta_2*sum((i,j,pie)$(cout(i,j,pie)>0.1),(sum((t,s)$(time_p(pie,t,s)=1),sum(a,y(m,a,i,j,t,s)))-cout(i,j,pie))*(sum((t,s)$(time_p(pie,t,s)=1),sum(a,y(m,a,i,j,t,s)))-cout(i,j,pie)))); ;
         display total_deviation;
);

**-------------------Dantzig-Wolfe Algorithm----------------------------**

*-----------------------------------------------------------------------
* direct LP formulation
*-----------------------------------------------------------------------

parameter Est_TT_gourp_time(a);
Est_TT_gourp_time(a)=sum((i,j,t,s)$(net(i,j,t,s)>0.1), y('21',a,i,j,t,s )*c(i,j,t,s));

parameter est_cout(i,j,pie);
est_cout(i,j,pie)$(cout(i,j,pie)>0.1)=sum((t,s)$(time_p(pie,t,s)=1),sum(a,y('21',a,i,j,t,s)));

variable z_dw;
positive variables
x_dw(a,i,j,t,s)  ;

equations
obj_arc_dw
comm_flow_on_node_origin_dw(a,i,t)         origin node flow
comm_flow_on_node_intermediate_dw(a,i,t)   intermediate node flow
comm_flow_on_node_destination_dw(a,i,t)      destination node flow
cap_constraint_dw(i,j,t,s)                  vehicle capacity
Est_totoal_group_time_dw(a)                 estimated group trip time
est_arc_flow_dw(i,j,pie)                    estimated flow in one time period
;

obj_arc_dw..  z_dw =e= sum(a,x_dw(a,'8','5','3','4')*c('8','5','3','4'));
comm_flow_on_node_origin_dw(a,i,t)$(origin(a,i,t)>0.1) .. sum((j,s)$(net(i,j,t,s)>0.1), x_dw(a,i,j,t,s)) =e= origin(a,i,t);
comm_flow_on_node_destination_dw(a,i,t)$(destination(a,i,t)>0.1) ..  sum((j,s)$(net(j,i,s,t)>0.1), x_dw(a,j,i,s,t))=e= destination(a,i,t);
comm_flow_on_node_intermediate_dw(a,i,t)$(intermediate(a,i,t)>0.1).. sum((j,s)$(net(i,j,t,s)>0.1), x_dw(a,i, j, t,s))-sum((j,s)$(net(j,i,s,t)>0.1), x_dw(a,j,i,s,t))=e= 0;
cap_constraint_dw(i,j,t,s)$(net(i,j,t,s)>0.1).. Cap(i,j,t,s)-sum(a,x_dw(a,i,j,t,s)) =g=0;
Est_totoal_group_time_dw(a).. sum((i,j,t,s)$(net(i,j,t,s)>0.1),c(i,j,t,s)*x_dw(a,i,j,t,s))=e= Est_TT_gourp_time(a);
est_arc_flow_dw(i,j,pie)$(est_cout(i,j,pie)>0.1)..sum((t,s)$(time_p(pie,t,s)=1),sum(a,x_dw(a,i,j,t,s)))=e= est_cout(i,j,pie);

model primal_model/obj_arc_dw,comm_flow_on_node_origin_dw,comm_flow_on_node_destination_dw,comm_flow_on_node_intermediate_dw,cap_constraint_dw,Est_totoal_group_time_dw,est_arc_flow_dw/;
solve primal_model minimizing z_dw using lp;
display z_dw.l;

*-----------------------------------------------------------------------
* subproblems for the shorest path problem
*-----------------------------------------------------------------------

positive variables xsub(i,j,t,s);
variables zsub;

parameters
   origin_sub(i,t)
   destination_sub(i,t)
   intermediate_sub(i,t)
   pi1(i,j,t,s) 'dual of limit'
   pi2(a)   'dual of convexity constraint'
   pi2a
   pi3(a)   'dual of estimated group_1 (<=) time constraint'
   pi3a
   pi4(a)   'dual of estimated group_2 (>=) time constraint'
   pi4a
   pi5(i,j,pie)   'dual of estimated group_1(<=) count constraint'
   pi6(i,j,pie)   'dual of estimated group_2(>=) count constraint'
;

equations
comm_flow_on_node_origin_sub(i,t)         origin node flow
comm_flow_on_node_intermediate_sub(i,t)   intermediate node flow
comm_flow_on_node_destination_sub(i,t)      destination node flow
rc1_sub          'phase 1 objective: reduced cost'
rc2_sub          'phase 2 objective: reduced cost'
;

comm_flow_on_node_origin_sub(i,t)$(origin_sub(i,t)>0.1).. sum((j,s)$(net(i,j,t,s)>0.1),xsub(i,j,t,s)) =e= origin_sub(i,t);
comm_flow_on_node_intermediate_sub(i,t)$(intermediate_sub(i,t)>0.1).. sum((j,s)$(net(i,j,t,s)>0.1), xsub(i,j,t,s))-sum((j,s)$(net(j,i,s,t)>0.1), xsub(j,i,s,t))=e= 0;
comm_flow_on_node_destination_sub(i,t)$(destination_sub(i,t)>0.1) ..  sum((j,s)$(net(j,i,s,t)>0.1), xsub(j,i,s,t))=e= destination_sub(i,t);
rc1_sub..       zsub =e= sum((i,j,t,s), -pi1(i,j,t,s)*xsub(i,j,t,s)) - pi2a - pi3a*sum((i,j,t,s),c(i,j,t,s)*xsub(i,j,t,s))+ pi4a*sum((i,j,t,s),c(i,j,t,s)*xsub(i,j,t,s))-sum((i,j,pie)$(est_cout(i,j,pie)>0.1),pi5(i,j,pie)*sum((t,s)$(time_p(pie,t,s)=1),xsub(i,j,t,s)))+sum((i,j,pie)$(est_cout(i,j,pie)>0.1),pi6(i,j,pie)*sum((t,s)$(time_p(pie,t,s)=1),xsub(i,j,t,s)));
rc2_sub..       zsub =e= xsub('8','5','3','4')+sum((i,j,t,s), -pi1(i,j,t,s)*xsub(i,j,t,s)) - pi2a - pi3a*sum((i,j,t,s),c(i,j,t,s)*xsub(i,j,t,s))+ pi4a*sum((i,j,t,s),c(i,j,t,s)*xsub(i,j,t,s))-sum((i,j,pie)$(est_cout(i,j,pie)>0.1),pi5(i,j,pie)*sum((t,s)$(time_p(pie,t,s)=1),xsub(i,j,t,s)))+sum((i,j,pie)$(est_cout(i,j,pie)>0.1),pi6(i,j,pie)*sum((t,s)$(time_p(pie,t,s)=1),xsub(i,j,t,s)));

model sub1 'phase 1 subproblem' /comm_flow_on_node_origin_sub, comm_flow_on_node_intermediate_sub,comm_flow_on_node_destination_sub, rc1_sub/;
model sub2 'phase 2 subproblem' /comm_flow_on_node_origin_sub, comm_flow_on_node_intermediate_sub,comm_flow_on_node_destination_sub, rc2_sub/;

*-----------------------------------------------------------------------
* master problem
*-----------------------------------------------------------------------

set k_dw 'pro count/extrem point' /pro1*pro1000/;
set ak_dw(a,k_dw)'dynamic set';
ak_dw(a,k_dw) = no;

parameter pro(i,j,t,s,a,k_dw)    for capacity constraints;
parameter procost(a,k_dw)        for objective function;
parameter procost_group_time(a,k_dw)  for group trip time;
parameter procost_count(i,j,pie,a,k_dw) for link volume in one time period;

pro(i,j,t,s,a,k_dw) = 0;
procost(a,k_dw) = 0;
procost_group_time(a,k_dw) = 0;
procost_count(i,j,pie,a,k_dw) = 0;

positive variables
   lambda(a,k_dw)    'weights on each extreme point'
   excess(i,j,t,s)         'artificial variable for capacity constraints'
   excess_group_time_1(a) 'artificial variable for trip time group 1'
   excess_group_time_2(a) 'artificial variable for trip time group 2'
   excess_count_1(i,j,pie) 'artificial variable for link count group 1'
   excess_count_2(i,j,pie) 'artificial variable for link count group 2'
;
variable zmaster;

equations
    obj1_master    'phase 1 objective'
    obj2_master    'phase 2 objective'
    capacity_limit_master(i,j,t,s)
    convex_master(a)
    est_total_group_time_master_1(a)
    est_total_group_time_master_2(a)
    est_total_count_master_1(i,j,pie)
    est_total_count_master_2(i,j,pie)
;

obj1_master..  zmaster =e= sum((i,j,t,s)$(net(i,j,t,s)>0.1),excess(i,j,t,s))+sum(a,excess_group_time_1(a))+sum(a,excess_group_time_2(a))+sum((i,j,pie)$(est_cout(i,j,pie)>0.1),excess_count_1(i,j,pie))+sum((i,j,pie)$(est_cout(i,j,pie)>0.1),excess_count_2(i,j,pie));
obj2_master..  zmaster =e= sum(ak_dw, procost(ak_dw)*lambda(ak_dw));

capacity_limit_master(i,j,t,s)..sum(ak_dw, pro(i,j,t,s,ak_dw)*lambda(ak_dw)) =l= cap(i,j,t,s) + excess(i,j,t,s);
convex_master(a).. sum(ak_dw(a,k_dw), lambda(a,k_dw)) =e= 1;
est_total_group_time_master_1(a)..sum(ak_dw(a,k_dw), procost_group_time(a,k_dw)*lambda(a,k_dw)) =l= Est_TT_gourp_time(a)+ excess_group_time_1(a);
est_total_group_time_master_2(a)..sum(ak_dw(a,k_dw), -procost_group_time(a,k_dw)*lambda(a,k_dw)) =l= -Est_TT_gourp_time(a)+ excess_group_time_2(a);
est_total_count_master_1(i,j,pie)$(est_cout(i,j,pie)>0.1)..sum(ak_dw(a,k_dw),procost_count(i,j,pie,a,k_dw)*lambda(a,k_dw)) =l= est_cout(i,j,pie)+ excess_count_1(i,j,pie);
est_total_count_master_2(i,j,pie)$(est_cout(i,j,pie)>0.1)..sum(ak_dw(a,k_dw), -procost_count(i,j,pie,a,k_dw)*lambda(a,k_dw)) =l= -est_cout(i,j,pie)+ excess_count_2(i,j,pie);

model master1 'phase 1 master' /obj1_master, capacity_limit_master, convex_master, est_total_group_time_master_1,est_total_group_time_master_2, est_total_count_master_1,est_total_count_master_2/;
model master2 'phase 2 master' /obj2_master, capacity_limit_master, convex_master, est_total_group_time_master_1, est_total_group_time_master_2,est_total_count_master_1,est_total_count_master_2/;

*-----------------------------------------------------------------------
* options to reduce solver output
*-----------------------------------------------------------------------

option limrow=0;
option limcol=0;

master1.solprint = 2;
master2.solprint = 2;

sub1.solprint = 2;
sub2.solprint = 2;

*-----------------------------------------------------------------------
* options to speed up solver execution
*-----------------------------------------------------------------------

master1.solvelink = 2;
master2.solvelink = 2;
sub1.solvelink = 2;
sub2.solvelink = 2;

*-----------------------------------------------------------------------
* DANTZIG-WOLFE INITIALIZATION PHASE
*    test subproblems for feasibility
*    create initial set of pros
*-----------------------------------------------------------------------

display "-----------------------------------------------------------------",
        "INITIALIZATION PHASE",
        "-----------------------------------------------------------------";

set kk(k_dw) 'current pro and dynamic set';
kk('pro1') = yes;

loop(a,

*
* solve subproblem, check feasibility
*
    origin_sub(i,t) = origin(a,i,t);
    destination_sub(i,t) = destination(a,i,t);
    intermediate_sub(i,t) = (1- origin_sub(i,t))* (1- destination_sub(i,t));
    pi1(i,j,t,s) = 0;
    pi2a = 0;
    pi3a = 0;
    pi4a = 0;
    pi5(i,j,pie) = 0;
    pi6(i,j,pie) = 0;
    solve sub2 using lp minimizing zsub;
    abort$(sub2.modelstat = 4) "SUBPROBLEM IS INFEASIBLE: ORIGINAL MODEL IS INFEASIBLE";
    abort$(sub2.modelstat <> 1) "SUBPROBLEM NOT SOLVED TO OPTIMALITY";

*
* pro generation
*
    pro(i,j,t,s,a,kk) = xsub.l(i,j,t,s);
    procost(a,kk) = xsub.l('8','5','3','4');
    procost_group_time(a,kk) = sum((i,j,t,s)$(net(i,j,t,s)>0.1), c(i,j,t,s)*xsub.l(i,j,t,s));
    procost_count(i,j,pie,a,kk) = sum((t,s)$(time_p(pie,t,s)=1), xsub.l(i,j,t,s));
    ak_dw(a,kk) = yes;
    kk(k_dw) = kk(k_dw-1);

);

option pro:2:2:2;
display pro;

*-----------------------------------------------------------------------
* DANTZIG-WOLFE ALGORITHM
*   while (true) do
*      solve restricted master
*      solve subproblems
*   until no more pros
*-----------------------------------------------------------------------

set iter_dw 'maximum iterations' /1*15/;
scalar done /0/;
scalar count /0/;
scalar phase /1/;
scalar iteration;

loop(iter_dw$(not done),

    iteration = ord(iter_dw);
    display "-----------------------------------------------------------------",
            iteration,
            "-----------------------------------------------------------------";

*
* solve master problem to get duals
*
    if (phase=1,
        solve master1 minimizing zmaster using lp;
        abort$(master1.modelstat <> 1) "MASTERPROBLEM NOT SOLVED TO OPTIMALITY";
        if (sum((i,j,t,s)$(net(i,j,t,s)>0.1),excess.l(i,j,t,s))+sum(a,excess_group_time_1.l(a))+sum(a,excess_group_time_2.l(a))+sum((i,j,pie)$(est_cout(i,j,pie)>0.1),excess_count_1.l(i,j,pie))+sum((i,j,pie)$(est_cout(i,j,pie)>0.1),excess_count_2.l(i,j,pie)) < 0.001,
           display "Switching to phase 2";
           display  excess.l;
           display  excess_group_time_1.l;
           display  excess_group_time_2.l;
           display  excess_count_1.l;
           display  excess_count_2.l;
           phase = 2;
           excess.fx(i,j,t,s) = 0;
           excess_group_time_1.fx(a) = 0;
           excess_group_time_2.fx(a) = 0;
           excess_count_1.fx(i,j,pie) = 0;
           excess_count_2.fx(i,j,pie) = 0;
        );

    );

    if (phase=2,
        solve master2 minimizing zmaster using lp;
        display lambda.l;
        abort$(master2.modelstat <> 1) "MASTERPROBLEM NOT SOLVED TO OPTIMALITY";
    );

    pi1(i,j,t,s) = capacity_limit_master.m(i,j,t,s);
    pi2(a) = convex_master.m(a);
    pi3(a) = est_total_group_time_master_1.m(a);
    pi4(a) = est_total_group_time_master_2.m(a);
    pi5(i,j,pie) = est_total_count_master_1.m(i,j,pie);
    pi6(i,j,pie) = est_total_count_master_2.m(i,j,pie);
    count = 0;
    loop(a$(not done),
*
* solve each subproblem
*
        origin_sub(i,t) = origin(a,i,t);
        destination_sub(i,t) = destination(a,i,t);
        intermediate_sub(i,t) = (1- origin_sub(i,t))* (1- destination_sub(i,t));
        pi2a = pi2(a);
        pi3a = pi3(a);
        pi4a = pi4(a);

        if (phase=1,
           solve sub1 using lp minimizing zsub;
           abort$(sub1.modelstat = 4) "SUBPROBLEM IS INFEASIBLE: ORIGINAL MODEL IS INFEASIBLE";
           abort$(sub1.modelstat <> 1) "SUBPROBLEM NOT SOLVED TO OPTIMALITY";
        else
           solve sub2 using lp minimizing zsub;
           abort$(sub2.modelstat = 4) "SUBPROBLEM IS INFEASIBLE: ORIGINAL MODEL IS INFEASIBLE";
           abort$(sub2.modelstat <> 1) "SUBPROBLEM NOT SOLVED TO OPTIMALITY";
        );
*
* pro
*
        if (zsub.l < -0.0001,
           count = count + 1;
           display "new pro", count,xsub.l;
           pro(i,j,t,s,a,kk) = xsub.l(i,j,t,s);
           procost(a,kk) = xsub.l('8','5','3','4');
           procost_group_time(a,kk) = sum((i,j,t,s)$(net(i,j,t,s)>0.1), c(i,j,t,s)*xsub.l(i,j,t,s));
           procost_count(i,j,pie,a,kk) = sum((t,s)$(time_p(pie,t,s)=1), c(i,j,t,s)*xsub.l(i,j,t,s));
           ak_dw(a,kk) = yes;
           kk(k_dw) = kk(k_dw-1);
       );

    );

*
* no new pros?
*
   abort$(count = 0 and phase = 1) "PROBLEM IS INFEASIBLE";
   done$(count = 0 and phase = 2) = 1;
);

abort$(not done) "Out of iterations";

*-----------------------------------------------------------------------
* recover solution
*-----------------------------------------------------------------------
display pro;

File link_pro/link_pro.txt/;
put link_pro;
loop((i,j,t,s,a,k_dw)$((pro(i,j,t,s,a,k_dw)>0.1)),put @10, i.tl, @20, j.tl,  @30, t.tl, @40, s.tl, @45,a.tl, @50,k_dw.tl, @55,pro(i,j,t,s,a,k_dw)/);

display lambda.l;

File lambda_pro/lambda_pro.txt/;
put lambda_pro;
loop((a,k_dw)$((lambda.l(a,k_dw)>0.001)),put @45,a.tl, @50,k_dw.tl, @55,lambda.l(a,k_dw)/);

parameter xsol(i,j,t,s,a);
xsol(i,j,t,s,a) = sum(ak_dw(a,k_dw), pro(i,j,t,s,ak_dw)*lambda.l(ak_dw));
display xsol;

parameter totalcost;
totalcost = sum((i,j,t,s,a), c(i,j,t,s)*xsol(i,j,t,s,a));
display totalcost;

parameter f_dw(i,j,t,s);
f_dw(i,j,t,s)=sum(a,xsol(i,j,t,s,a));
display f_dw;
