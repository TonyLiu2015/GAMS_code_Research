$ title dynamic transit service network design Problem

$inlinecom /* */
$offlisting
$offsymxref offsymlist
option limrow = 0, limcol = 0, solprint = off, sysout = off;

set i nodes /1*9/;
set t time stamp /0*60/;
set a agent /1*150/;
set k path /1*2/;
alias (i, j);
alias (t, s);

parameter c(i,j,t,s) link travel cost /
1.6.0.4 4
6.9.4.11 7
1.6.15.19 4
6.9.19.26 7
1.6.30.34 4
6.9.34.41 7
1.5.0.15 15
5.8.15.30 15
1.5.15.30 15
5.8.30.45 15
1.5.30.45 15
5.8.45.60 15
2.3.0.13 13
3.4.13.16 3
4.8.16.25 9
2.3.15.28 13
3.4.28.31 3
4.8.31.40 9
2.3.30.43 13
3.4.43.46 3
4.8.46.55 9
2.7.0.13 13
7.9.13.20 7
2.7.15.28 13
7.9.28.35 7
2.7.30.43 13
7.9.43.50 7
1.1.0.15 15
1.1.15.30 15
1.1.30.45 15
5.5.10.13 3
5.5.13.25 12
5.5.25.30 5
5.5.30.40 10
5.5.40.45 5
6.6.4.19 15
6.6.19.34 15
8.8.18.25 0
8.8.25.30 0
8.8.30.33 0
8.8.33.40 0
8.8.40.45 0
8.8.45.48 0
8.8.48.55 0
8.8.55.60 0
9.9.11.20 0
9.9.20.26 0
9.9.26.35 0
9.9.35.41 0
9.9.41.50 0
7.7.13.28 15
7.7.28.43 15
4.4.16.31 15
4.4.31.46 15
3.3.13.28 15
3.3.28.43 15
2.2.0.15 15
2.2.15.30 15
6.5.4.10 6
6.5.19.25 6
6.5.34.40 6
5.4.10.16 6
5.4.25.31 6
5.4.40.46 6
7.8.13.18 5
7.8.28.33 5
7.8.43.48 5
/;

parameter cap(i,j,t,s) link capacity /
1.6.0.4 20
6.9.4.11 20
1.6.15.19 20
6.9.19.26 20
1.6.30.34 20
6.9.34.41 20
1.5.0.15 20
5.8.15.30 20
1.5.15.30 20
5.8.30.45 20
1.5.30.45 20
5.8.45.60 20
2.3.0.13 20
3.4.13.16 20
4.8.16.25 20
2.3.15.28 20
3.4.28.31 20
4.8.31.40 20
2.3.30.43 20
3.4.43.46 20
4.8.46.55 20
2.7.0.13 20
7.9.13.20 20
2.7.15.28 20
7.9.28.35 20
2.7.30.43 20
7.9.43.50 20
1.1.0.15 40
1.1.15.30 40
1.1.30.45 40
5.5.10.13 30
5.5.13.25 30
5.5.25.30 30
5.5.30.40 30
5.5.40.45 30
6.6.4.19 30
6.6.19.34 30
8.8.18.25 1000
8.8.25.30 1000
8.8.30.33 1000
8.8.33.40 1000
8.8.40.45 1000
8.8.45.48 1000
8.8.48.55 1000
8.8.55.60 1000
9.9.11.20 1000
9.9.20.26 1000
9.9.26.35 1000
9.9.35.41 1000
9.9.41.50 1000
7.7.13.28 30
7.7.28.43 30
4.4.16.31 30
4.4.31.46 30
3.3.13.28 30
3.3.28.43 30
2.2.0.15 40
2.2.15.30 40
6.5.4.10 20
6.5.19.25 20
6.5.34.40 20
5.4.10.16 20
5.4.25.31 20
5.4.40.46 20
7.8.13.18 20
7.8.28.33 20
7.8.43.48 20
/;

parameter epsilon(a)/
1 15
2 15
3 15
4 15
5 15
6 15
7 15
8 15
9 15
10 15
11 15
12 15
13 15
14 15
15 15
16 15
17 15
18 15
19 15
20 15
21 15
22 15
23 15
24 15
25 15
26 15
27 15
28 15
29 15
30 15
31 15
32 15
33 15
34 15
35 15
36 15
37 15
38 15
39 15
40 15
41 15
42 15
43 15
44 15
45 15
46 15
47 15
48 15
49 15
50 15
51 15
52 15
53 15
54 15
55 15
56 15
57 15
58 15
59 15
60 15
61 15
62 15
63 15
64 15
65 15
66 15
67 15
68 15
69 15
70 15
71 15
72 15
73 15
74 15
75 15
76 15
77 15
78 15
79 15
80 15
81 15
82 15
83 15
84 15
85 15
86 15
87 15
88 15
89 15
90 15
91 15
92 15
93 15
94 15
95 15
96 15
97 15
98 15
99 15
100 15
101 15
102 15
103 15
104 15
105 15
106 15
107 15
108 15
109 15
110 15
111 15
112 15
113 15
114 15
115 15
116 15
117 15
118 15
119 15
120 15
121 15
122 15
123 15
124 15
125 15
126 15
127 15
128 15
129 15
130 15
131 15
132 15
133 15
134 15
135 15
136 15
137 15
138 15
139 15
140 15
141 15
142 15
143 15
144 15
145 15
146 15
147 15
148 15
149 15
150 15
/;

parameter original_least_path_time(a)/
1 30
2 30
3 30
4 30
5 30
6 30
7 30
8 30
9 30
10 30
11 11
12 11
13 11
14 11
15 11
16 11
17 11
18 11
19 11
20 11
21 15
22 15
23 15
24 15
25 15
26 25
27 25
28 25
29 25
30 25
31 25
32 25
33 25
34 25
35 25
36 20
37 20
38 20
39 20
40 20
41 20
42 20
43 20
44 20
45 20
46 12
47 12
48 12
49 12
50 12
51 30
52 30
53 30
54 30
55 30
56 30
57 30
58 30
59 30
60 30
61 11
62 11
63 11
64 11
65 11
66 11
67 11
68 11
69 11
70 11
71 15
72 15
73 15
74 15
75 15
76 25
77 25
78 25
79 25
80 25
81 25
82 25
83 25
84 25
85 25
86 20
87 20
88 20
89 20
90 20
91 20
92 20
93 20
94 20
95 20
96 12
97 12
98 12
99 12
100 12
101 30
102 30
103 30
104 30
105 30
106 30
107 30
108 30
109 30
110 30
111 11
112 11
113 11
114 11
115 11
116 11
117 11
118 11
119 11
120 11
121 15
122 15
123 15
124 15
125 15
126 25
127 25
128 25
129 25
130 25
131 25
132 25
133 25
134 25
135 25
136 20
137 20
138 20
139 20
140 20
141 20
142 20
143 20
144 20
145 20
146 12
147 12
148 12
149 12
150 12
/;

parameter M;
M = 60;

parameter index(a)/
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
11 2
12 2
13 2
14 2
15 2
16 2
17 2
18 2
19 2
20 2
21 3
22 3
23 3
24 3
25 3
26 4
27 4
28 4
29 4
30 4
31 4
32 4
33 4
34 4
35 4
36 5
37 5
38 5
39 5
40 5
41 5
42 5
43 5
44 5
45 5
46 6
47 6
48 6
49 6
50 6
51 7
52 7
53 7
54 7
55 7
56 7
57 7
58 7
59 7
60 7
61 8
62 8
63 8
64 8
65 8
66 8
67 8
68 8
69 8
70 8
71 9
72 9
73 9
74 9
75 9
76 10
77 10
78 10
79 10
80 10
81 10
82 10
83 10
84 10
85 10
86 11
87 11
88 11
89 11
90 11
91 11
92 11
93 11
94 11
95 11
96 12
97 12
98 12
99 12
100 12
101 13
102 13
103 13
104 13
105 13
106 13
107 13
108 13
109 13
110 13
111 14
112 14
113 14
114 14
115 14
116 14
117 14
118 14
119 14
120 14
121 15
122 15
123 15
124 15
125 15
126 16
127 16
128 16
129 16
130 16
131 16
132 16
133 16
134 16
135 16
136 17
137 17
138 17
139 17
140 17
141 17
142 17
143 17
144 17
145 17
146 18
147 18
148 18
149 18
150 18
/;

parameter r(i,j,t,s) existing link factor /
1.6.0.4 1
6.9.4.11 1
1.6.15.19 1
6.9.19.26 1
1.6.30.34 1
6.9.34.41 1
1.5.0.15 1
5.8.15.30 1
1.5.15.30 1
5.8.30.45 1
1.5.30.45 1
5.8.45.60 1
2.3.0.13 1
3.4.13.16 1
4.8.16.25 1
2.3.15.28 1
3.4.28.31 1
4.8.31.40 1
2.3.30.43 1
3.4.43.46 1
4.8.46.55 1
2.7.0.13 1
7.9.13.20 1
2.7.15.28 1
7.9.28.35 1
2.7.30.43 1
7.9.43.50 1
1.1.0.15 1
1.1.15.30 1
1.1.30.45 1
5.5.10.13 1
5.5.13.25 1
5.5.25.30 1
5.5.30.40 1
5.5.40.45 1
6.6.4.19 1
6.6.19.34 1
8.8.18.25 1
8.8.25.30 1
8.8.30.33 1
8.8.33.40 1
8.8.40.45 1
8.8.45.48 1
8.8.48.55 1
8.8.55.60 1
9.9.11.20 1
9.9.20.26 1
9.9.26.35 1
9.9.35.41 1
9.9.41.50 1
7.7.13.28 1
7.7.28.43 1
4.4.16.31 1
4.4.31.46 1
3.3.13.28 1
3.3.28.43 1
2.2.0.15 1
2.2.15.30 1
/;

parameter origin(a,i,t) /
1.1.0 1
2.1.0 1
3.1.0 1
4.1.0 1
5.1.0 1
6.1.0 1
7.1.0 1
8.1.0 1
9.1.0 1
10.1.0 1
11.1.0 1
12.1.0 1
13.1.0 1
14.1.0 1
15.1.0 1
16.1.0 1
17.1.0 1
18.1.0 1
19.1.0 1
20.1.0 1
21.5.15 1
22.5.15 1
23.5.15 1
24.5.15 1
25.5.15 1
26.2.0 1
27.2.0 1
28.2.0 1
29.2.0 1
30.2.0 1
31.2.0 1
32.2.0 1
33.2.0 1
34.2.0 1
35.2.0 1
36.2.0 1
37.2.0 1
38.2.0 1
39.2.0 1
40.2.0 1
41.2.0 1
42.2.0 1
43.2.0 1
44.2.0 1
45.2.0 1
46.3.13 1
47.3.13 1
48.3.13 1
49.3.13 1
50.3.13 1
51.1.15 1
52.1.15 1
53.1.15 1
54.1.15 1
55.1.15 1
56.1.15 1
57.1.15 1
58.1.15 1
59.1.15 1
60.1.15 1
61.1.15 1
62.1.15 1
63.1.15 1
64.1.15 1
65.1.15 1
66.1.15 1
67.1.15 1
68.1.15 1
69.1.15 1
70.1.15 1
71.5.30 1
72.5.30 1
73.5.30 1
74.5.30 1
75.5.30 1
76.2.15 1
77.2.15 1
78.2.15 1
79.2.15 1
80.2.15 1
81.2.15 1
82.2.15 1
83.2.15 1
84.2.15 1
85.2.15 1
86.2.15 1
87.2.15 1
88.2.15 1
89.2.15 1
90.2.15 1
91.2.15 1
92.2.15 1
93.2.15 1
94.2.15 1
95.2.15 1
96.3.28 1
97.3.28 1
98.3.28 1
99.3.28 1
100.3.28 1
101.1.30 1
102.1.30 1
103.1.30 1
104.1.30 1
105.1.30 1
106.1.30 1
107.1.30 1
108.1.30 1
109.1.30 1
110.1.30 1
111.1.30 1
112.1.30 1
113.1.30 1
114.1.30 1
115.1.30 1
116.1.30 1
117.1.30 1
118.1.30 1
119.1.30 1
120.1.30 1
121.5.45 1
122.5.45 1
123.5.45 1
124.5.45 1
125.5.45 1
126.2.30 1
127.2.30 1
128.2.30 1
129.2.30 1
130.2.30 1
131.2.30 1
132.2.30 1
133.2.30 1
134.2.30 1
135.2.30 1
136.2.30 1
137.2.30 1
138.2.30 1
139.2.30 1
140.2.30 1
141.2.30 1
142.2.30 1
143.2.30 1
144.2.30 1
145.2.30 1
146.3.43 1
147.3.43 1
148.3.43 1
149.3.43 1
150.3.43 1
/;

parameter destination(a,i,t) /
1.8.60 1
2.8.60 1
3.8.60 1
4.8.60 1
5.8.60 1
6.8.60 1
7.8.60 1
8.8.60 1
9.8.60 1
10.8.60 1
11.9.50 1
12.9.50 1
13.9.50 1
14.9.50 1
15.9.50 1
16.9.50 1
17.9.50 1
18.9.50 1
19.9.50 1
20.9.50 1
21.8.60 1
22.8.60 1
23.8.60 1
24.8.60 1
25.8.60 1
26.8.60 1
27.8.60 1
28.8.60 1
29.8.60 1
30.8.60 1
31.8.60 1
32.8.60 1
33.8.60 1
34.8.60 1
35.8.60 1
36.9.50 1
37.9.50 1
38.9.50 1
39.9.50 1
40.9.50 1
41.9.50 1
42.9.50 1
43.9.50 1
44.9.50 1
45.9.50 1
46.8.60 1
47.8.60 1
48.8.60 1
49.8.60 1
50.8.60 1
51.8.60 1
52.8.60 1
53.8.60 1
54.8.60 1
55.8.60 1
56.8.60 1
57.8.60 1
58.8.60 1
59.8.60 1
60.8.60 1
61.9.50 1
62.9.50 1
63.9.50 1
64.9.50 1
65.9.50 1
66.9.50 1
67.9.50 1
68.9.50 1
69.9.50 1
70.9.50 1
71.8.60 1
72.8.60 1
73.8.60 1
74.8.60 1
75.8.60 1
76.8.60 1
77.8.60 1
78.8.60 1
79.8.60 1
80.8.60 1
81.8.60 1
82.8.60 1
83.8.60 1
84.8.60 1
85.8.60 1
86.9.50 1
87.9.50 1
88.9.50 1
89.9.50 1
90.9.50 1
91.9.50 1
92.9.50 1
93.9.50 1
94.9.50 1
95.9.50 1
96.8.60 1
97.8.60 1
98.8.60 1
99.8.60 1
100.8.60 1
101.8.60 1
102.8.60 1
103.8.60 1
104.8.60 1
105.8.60 1
106.8.60 1
107.8.60 1
108.8.60 1
109.8.60 1
110.8.60 1
111.9.50 1
112.9.50 1
113.9.50 1
114.9.50 1
115.9.50 1
116.9.50 1
117.9.50 1
118.9.50 1
119.9.50 1
120.9.50 1
121.8.60 1
122.8.60 1
123.8.60 1
124.8.60 1
125.8.60 1
126.8.60 1
127.8.60 1
128.8.60 1
129.8.60 1
130.8.60 1
131.8.60 1
132.8.60 1
133.8.60 1
134.8.60 1
135.8.60 1
136.9.50 1
137.9.50 1
138.9.50 1
139.9.50 1
140.9.50 1
141.9.50 1
142.9.50 1
143.9.50 1
144.9.50 1
145.9.50 1
146.8.60 1
147.8.60 1
148.8.60 1
149.8.60 1
150.8.60 1
/;

parameter node_index(i,t) /
1.0 1
1.15 1
1.30 1
5.10 1
5.13 1
5.25 1
5.30 1
5.40 1
5.45 1
6.4 1
6.19 1
6.34 1
8.18 1
8.25 1
8.30 1
8.33 1
8.40 1
8.45 1
8.48 1
8.55 1
8.60 1
9.11 1
9.20 1
9.26 1
9.35 1
9.41 1
9.50 1
7.13 1
7.28 1
7.43 1
4.16 1
4.31 1
4.46 1
3.13 1
3.28 1
3.43 1
2.0 1
2.15 1
2.30 1
/;

parameter ind(a,k) agent /
1.1 1
2.1 1
3.1 1
4.1 1
5.1 1
6.1 1
7.1 1
8.1 1
9.1 1
10.1 1
11.1 1
12.1 1
13.1 1
14.1 1
15.1 1
16.1 1
17.1 1
18.1 1
19.1 1
20.1 1
21.1 1
22.1 1
23.1 1
24.1 1
25.1 1
26.1 1
27.1 1
28.1 1
29.1 1
30.1 1
31.1 1
32.1 1
33.1 1
34.1 1
35.1 1
36.1 1
37.1 1
38.1 1
39.1 1
40.1 1
41.1 1
42.1 1
43.1 1
44.1 1
45.1 1
46.1 1
47.1 1
48.1 1
49.1 1
50.1 1
51.1 1
52.1 1
53.1 1
54.1 1
55.1 1
56.1 1
57.1 1
58.1 1
59.1 1
60.1 1
61.1 1
62.1 1
63.1 1
64.1 1
65.1 1
66.1 1
67.1 1
68.1 1
69.1 1
70.1 1
71.1 1
72.1 1
73.1 1
74.1 1
75.1 1
76.1 1
77.1 1
78.1 1
79.1 1
80.1 1
81.1 1
82.1 1
83.1 1
84.1 1
85.1 1
86.1 1
87.1 1
88.1 1
89.1 1
90.1 1
91.1 1
92.1 1
93.1 1
94.1 1
95.1 1
96.1 1
97.1 1
98.1 1
99.1 1
100.1 1
101.1 1
102.1 1
103.1 1
104.1 1
105.1 1
106.1 1
107.1 1
108.1 1
109.1 1
110.1 1
111.1 1
112.1 1
113.1 1
114.1 1
115.1 1
116.1 1
117.1 1
118.1 1
119.1 1
120.1 1
121.1 1
122.1 1
123.1 1
124.1 1
125.1 1
126.1 1
127.1 1
128.1 1
129.1 1
130.1 1
131.1 1
132.1 1
133.1 1
134.1 1
135.1 1
136.1 1
137.1 1
138.1 1
139.1 1
140.1 1
141.1 1
142.1 1
143.1 1
144.1 1
145.1 1
146.1 1
147.1 1
148.1 1
149.1 1
150.1 1
1.2 2
2.2 2
3.2 2
4.2 2
5.2 2
6.2 2
7.2 2
8.2 2
9.2 2
10.2 2
26.2 2
27.2 2
28.2 2
29.2 2
30.2 2
31.2 2
32.2 2
33.2 2
34.2 2
35.2 2
51.2 2
52.2 2
53.2 2
54.2 2
55.2 2
56.2 2
57.2 2
58.2 2
59.2 2
60.2 2
76.2 2
77.2 2
78.2 2
79.2 2
80.2 2
81.2 2
82.2 2
83.2 2
84.2 2
85.2 2
101.2 2
102.2 2
103.2 2
104.2 2
105.2 2
106.2 2
107.2 2
108.2 2
109.2 2
110.2 2
126.2 2
127.2 2
128.2 2
129.2 2
130.2 2
131.2 2
132.2 2
133.2 2
134.2 2
135.2 2
/;

parameter intermediate(a,i,t);
intermediate(a,i,t)$(node_index(i,t)>0.1) = (1- origin(a,i,t))* (1- destination(a,i,t));

variable z;
variable z_1;
variable z_2;
variable f(i,j,t,s);

binary variables
x(a,i,j,t,s )  selection of  comm p between i and j;

binary variables y(i,j,t,s);
y.fx(i,j,t,s)$(r(i,j,t,s)>0.1)=1;

parameter miu(i,j,t,s);
miu(i,j,t,s)$(cap(i,j,t,s)>0.1)=0.1;

parameter lamda(a,k);
lamda(a,k)=0.1;

equations
so_obj
obj_x
obj_y
comm_flow_on_node_origin(a,i,t)         origin node flow pv on node i at time t
comm_flow_on_node_intermediate(a,i,t)   intermediate node flow k on node i at time t
comm_flow_on_node_destination(a,i,t)      destination node flow k on node i at time t
flow_def(i,j,t,s)
*budget_constraint
cap_constraint(i,j,t,s)
BRUE_1(a)
BRUE_2(a)
BRUE_3(a)
BRUE_4(a)
BRUE_5(a)
BRUE_6(a)
BRUE_7(a);

so_obj.. z =e= sum((i,j,t,s)$(cap(i,j,t,s)>0.1), f(i,j,t,s)*c(i,j,t,s));
obj_x.. z_1 =e= sum((a,i,j,t,s)$(cap(i,j,t,s)>0.1),x(a,i,j,t,s)*(c(i,j,t,s)+miu(i,j,t,s)))+sum((a,k)$(ind(a,k)>0.1),lamda(a,k)*sum((i,j,t,s)$(cap(i,j,t,s)>0.1),x(a,i,j,t,s)*c(i,j,t,s)));
obj_y.. z_2 =e= sum((i,j,t,s)$(cap(i,j,t,s)>0.1),miu(i,j,t,s)*cap(i,j,t,s)*y(i,j,t,s))+sum((a,k)$(ind(a,k)=1),lamda(a,k)*(original_least_path_time(a)+epsilon(a)))+sum((a,k)$(ind(a,k)=2 and index(a)=1),lamda(a,k)*(25+(1-y('6','5','4','10'))*M+(1-y('5','4','10','16'))*M+epsilon(a)))+sum((a,k)$(ind(a,k)=2 and index(a)=4),lamda(a,k)*(18+(1-y('7','8','13','18'))*M+epsilon(a)))+sum((a,k)$(ind(a,k)=2 and index(a)=7),lamda(a,k)*(25+(1-y('6','5','19','25'))*M
+(1-y('5','4','25','31'))*M+epsilon(a)))+sum((a,k)$(ind(a,k)=2 and index(a)=10),lamda(a,k)*(18+(1-y('7','8','28','33'))*M+epsilon(a)))+sum((a,k)$(ind(a,k)=2 and index(a)=13),lamda(a,k)*(25+(1-y('6','5','34','40'))*M+(1-y('5','4','40','46'))*M+epsilon(a)))+sum((a,k)$(ind(a,k)=2 and index(a)=16),lamda(a,k)*(18+(1-y('7','8','43','48'))*M+epsilon(a)));
comm_flow_on_node_origin(a,i,t)$(origin(a,i,t)=1) .. sum((j,s)$(cap(i,j,t,s)>0.1), x(a,i,j,t,s)) =e= origin(a,i,t);
comm_flow_on_node_destination(a,i,t)$(destination(a,i,t)=1) ..  sum((j,s)$(cap(j,i,s,t)>0.1), x(a,j,i,s,t))=e= destination(a,i,t);
comm_flow_on_node_intermediate(a,i,t)$(intermediate(a,i,t)=1).. sum((j,s)$(cap(i,j,t,s)>0.1), x(a,i, j, t,s))-sum((j,s)$(cap(j,i,s,t)>0.1), x(a,j,i,s,t))=e= 0;
flow_def(i,j,t,s)..f(i,j,t,s) =e= sum(a,x(a,i,j,t,s));
*budget_constraint..  sum((i,j), ccost(i,j)*y(i,j)) =l= Budget;
cap_constraint(i,j,t,s)$(cap(i,j,t,s)>0.1).. cap(i,j,t,s)*y(i,j,t,s)-f(i,j,t,s) =g=0;
BRUE_1(a).. sum((i,j,t,s)$(cap(i,j,t,s)>0.1), x(a,i,j,t,s)*c(i,j,t,s))=l= original_least_path_time(a) + epsilon(a);
BRUE_2(a)$(index(a)=1).. sum((i,j,t,s)$(cap(i,j,t,s)>0.1), x(a,i,j,t,s)*c(i,j,t,s))=l= 25+(1-y('6','5','4','10'))*M+(1-y('5','4','10','16'))*M+epsilon(a);
BRUE_3(a)$(index(a)=4).. sum((i,j,t,s)$(cap(i,j,t,s)>0.1), x(a,i,j,t,s)*c(i,j,t,s))=l= 18+(1-y('7','8','13','18'))*M+epsilon(a);
BRUE_4(a)$(index(a)=7).. sum((i,j,t,s)$(cap(i,j,t,s)>0.1), x(a,i,j,t,s)*c(i,j,t,s))=l= 25+(1-y('6','5','19','25'))*M+(1-y('6','5','25','31'))*M+epsilon(a);
BRUE_5(a)$(index(a)=10).. sum((i,j,t,s)$(cap(i,j,t,s)>0.1), x(a,i,j,t,s)*c(i,j,t,s))=l= 18+(1-y('7','8','28','33'))*M+epsilon(a);
BRUE_6(a)$(index(a)=13).. sum((i,j,t,s)$(cap(i,j,t,s)>0.1), x(a,i,j,t,s)*c(i,j,t,s))=l= 25+(1-y('6','5','34','40'))*M+(1-y('5','4','40','46'))*M+epsilon(a);
BRUE_7(a)$(index(a)=16).. sum((i,j,t,s)$(cap(i,j,t,s)>0.1), x(a,i,j,t,s)*c(i,j,t,s))=l= 18+(1-y('7','8','43','48'))*M+epsilon(a);

Model oz_1 /all/ ;
*solve oz_1 using MIP minimizing z;
Model Dynamic_Discrete_Network_Design_x /obj_x,comm_flow_on_node_origin,comm_flow_on_node_destination,comm_flow_on_node_intermediate/;
Model Dynamic_Discrete_Network_Design_y /obj_y/;

parameter subgradient_capacity(i,j,t,s);
parameter subgradient_path_1(a,k);
parameter subgradient_path_2(a,k);
parameter subgradient_path_3(a,k);
parameter subgradient_path_4(a,k);
parameter subgradient_path_5(a,k);
parameter subgradient_path_6(a,k);
parameter subgradient_path_7(a,k);

parameter z_lb;
parameter step;
step = 1;
parameter i_value;
i_value = 1;
parameter zlbest;
zlbest=0;
parameter n;
n=0;

sets iter  subgradient iteration index / iter1 * iter20 /;
File output_obj_lb/dynamic_network_design_lb_1.txt/;
put output_obj_lb;

Loop (iter,

         solve Dynamic_Discrete_Network_Design_x using MIP minimizing z_1;
         solve Dynamic_Discrete_Network_Design_y using MIP maximizing z_2;

         subgradient_capacity(i,j,t,s)$(cap(i,j,t,s)> 0)= sum(a,x.l(a,i,j,t,s))-y.l(i,j,t,s)*Cap(i,j,t,s);
         miu(i,j,t,s)$(cap(i,j,t,s)>0)= max(0,miu(i,j,t,s) + step*subgradient_capacity(i,j,t,s));

         subgradient_path_1(a,k)$(ind(a,k)=1)= sum((i,j,t,s),x.l(a,i,j,t,s)*c(i,j,t,s))-original_least_path_time(a)-epsilon(a);
         subgradient_path_2(a,k)$(ind(a,k)=2 and index(a)=1)= sum((i,j,t,s),x.l(a,i,j,t,s)*c(i,j,t,s))-25-(1-y.l('6','5','4','10'))*M-(1-y.l('5','4','10','16'))*M-epsilon(a);
         subgradient_path_3(a,k)$(ind(a,k)=2 and index(a)=4)= sum((i,j,t,s),x.l(a,i,j,t,s)*c(i,j,t,s))-18-(1-y.l('7','8','13','18'))*M-epsilon(a);
         subgradient_path_4(a,k)$(ind(a,k)=2 and index(a)=7)= sum((i,j,t,s),x.l(a,i,j,t,s)*c(i,j,t,s))-25-(1-y.l('6','5','19','25'))*M-(1-y.l('5','4','25','31'))*M-epsilon(a);
         subgradient_path_5(a,k)$(ind(a,k)=2 and index(a)=10)= sum((i,j,t,s),x.l(a,i,j,t,s)*c(i,j,t,s))-18-(1-y.l('7','8','28','33'))*M-epsilon(a);
         subgradient_path_6(a,k)$(ind(a,k)=2 and index(a)=13)= sum((i,j,t,s),x.l(a,i,j,t,s)*c(i,j,t,s))-25-(1-y.l('6','5','34','40'))*M-(1-y.l('5','4','40','46'))*M-epsilon(a);
         subgradient_path_7(a,k)$(ind(a,k)=2 and index(a)=16)= sum((i,j,t,s),x.l(a,i,j,t,s)*c(i,j,t,s))-18-(1-y.l('7','8','43','48'))*M-epsilon(a);

         lamda(a,k)$(ind(a,k)=1)=max(0,lamda(a,k)+step*subgradient_path_1(a,k));
         lamda(a,k)$(ind(a,k)=2 and index(a)=1)=max(0,lamda(a,k)+step*subgradient_path_2(a,k));
         lamda(a,k)$(ind(a,k)=2 and index(a)=4)=max(0,lamda(a,k)+step*subgradient_path_3(a,k));
         lamda(a,k)$(ind(a,k)=2 and index(a)=7)=max(0,lamda(a,k)+step*subgradient_path_4(a,k));
         lamda(a,k)$(ind(a,k)=2 and index(a)=10)=max(0,lamda(a,k)+step*subgradient_path_5(a,k));
         lamda(a,k)$(ind(a,k)=2 and index(a)=13)=max(0,lamda(a,k)+step*subgradient_path_6(a,k));
         lamda(a,k)$(ind(a,k)=2 and index(a)=16)=max(0,lamda(a,k)+step*subgradient_path_7(a,k));

         i_value = i_value +1;
         step = 1/i_value;

         z_lb = z_1.l - z_2.l;
         zlbest = max(zlbest,z_lb);
         n = i_value-1;

         display miu;
         display lamda;

         put @3,n,@15,z_1.l,@30,z_2.l,@45,z_lb,@60,zlbest /
);

display y.l;






