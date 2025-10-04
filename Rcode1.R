package ‘zip’ successfully unpacked and MD5 sums checked
package ‘openxlsx’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\Namita\AppData\Local\Temp\Rtmp8yiH6v\downloaded_packages


library(readxl)
VLBWI <- read_excel("R Datafiles/VLBWI.xlsx")
View(VLBWI)

> dim(VLBWI)
[1] 671  21

race(> dim(VLBWI)
     [1] 671  21)

> table(VLBWI$race)
black native american        oriental           white 
 369              16               4             257


Gestdata =factor(VLBWI$gest)
summary(Gestdata)
  22   23   24   25 25.5   26 26.5   27 27.5   28 28.5   29 29.5   30   31 31.5   32   33 
   1   11   11   40    1   55    5   66    8 102    4   92    6   83   79    5   55   19 
33.5   34   35   36   38   40 NA's 
  2       14    5    1       1     1    4 

bwtdata =factor(VLBWI$bwt)
> summary(bwtdata)
   1100    1200    1480    1000    1500    1300    1120    1180    1230    1420     800 
     21      19      19      17      14      13      12      12      12      12      11 
    880     920    1250    1360    1400    1450    1140    1240    1280    1320     980 
     11      11      11      11      11      11      10      10      10      10       9 
   1290    1340    1350     600     740     760     900    1160    1440     850     940 
      9       9       9       8       8       8       8       8       8       7       7 
    990    1060    1310     820    1010    1030    1110    1150    1170    1210    1220 
      7       7       7       6       6       6       6       6       6       6       6 
   1330    1370    1390    1460     670     700     780     790     950     970    1070 
      6       6       6       6       5       5       5       5       5       5       5 
   1260    1380    1490     500     540     720     805     860     870     910    1020 
      5       5       5       4       4       4       4       4       4       4       4 
   1050    1080    1270     610     660     750     770     830     960    1040    1090 
      4       4       4       3       3       3       3       3       3       3       3 
   1130    1430     400     550     570     620     630     640     650     652     675 
      3       3       2       2       2       2       2       2       2       2       2 
    730     745     765     840     890     905     930    1075    1115    1255 (Other) 
      2       2       2       2       2       2       2       2       2       2      48 
   NA's 
      2
boxplot(VLBWI$gest, ylab="gestational age", main="box plot of gestaional age")
>
 
> boxplot(VLBWI$lowph, ylab="lowph", main="box plot of lowph")

hist(VLBWI$gest, ylab="frequency",xlab="gest", main="histogram of gestational age")
 
lm(formula = lowph ~ gest, data = VLBWI)

Call:
lm(formula = lowph ~ gest, data = VLBWI)

Coefficients:
(Intercept)         gest  
    6.43510      0.02648

Call:
lm(formula = lowph ~ gest, data = VLBWI)

Coefficients:
(Intercept)         gest  
    6.43510      0.02648  

> M1<-lm(formula = lowph ~ gest, data = VLBWI)
> SummaryM1
Error: object 'SummaryM1' not found
> summary(M1)

Call:
lm(formula = lowph ~ gest, data = VLBWI)

Residuals:
     Min       1Q   Median       3Q      Max 
-0.59350 -0.06660  0.01531  0.09059  0.29593 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 6.435101   0.062129  103.58   <2e-16 ***
gest        0.026477   0.002136   12.39   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.1274 on 606 degrees of freedom
  (63 observations deleted due to missingness)
Multiple R-squared:  0.2022,	Adjusted R-squared:  0.2009 
F-statistic: 153.6 on 1 and 606 DF,  p-value: < 2.2e-16
--------------------------------------------------------------------------------------------------------------------------------- 
summary(VLBWI$gest)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
  22.00   27.00   29.00   28.87   31.00   40.00       4
---------------------------------------------------------------------------------------------------------------------------- 

plot(VLBWI$lowph, VLBWI$gest, col=c("red", "blue"), xlab="gestational age", ylab="lowph", main="scatter plot lowph and gestational age")S
 
race_bwtdata=subset(VLBWI, select=c(race, bwt))
> table(race_bwtdata)
                 bwt
race              400 430 460 480 500 510 540 550 560 565 570 575 580 587 590 600 610 620
  black             1   1   1   1   4   0   2   0   0   1   2   1   0   1   0   5   2   2
  native american   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0
  oriental          0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
  white             0   0   0   0   0   1   0   0   0   0   0   0   0   0   0   2   0   0
                 bwt
race              625 630 640 650 652 660 670 675 680 687 700 710 720 730 740 745 750 760
  black             1   1   1   0   2   1   5   1   1   1   3   1   2   2   7   2   1   6
  native american   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
  oriental          0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
  white             0   0   0   1   0   2   0   1   0   0   1   0   2   0   1   0   1   2
                 bwt
race              765 770 780 790 800 805 808 810 820 825 830 835 840 850 860 865 870 875
  black             2   1   3   1   8   2   0   1   6   1   2   0   1   5   1   1   3   0
  native american   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0
  oriental          0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
  white             0   2   2   4   3   1   1   0   0   0   0   1   1   2   3   0   1   1
                 bwt
race              880 890 900 905 910 920 925 930 940 950 960 970 975 980 990 1000 1005
  black             5   0   4   1   3   5   1   1   5   2   0   2   0   5   5   10    0
  native american   0   0   0   0   0   0   0   0   0   2   0   0   0   0   0    0    1
  oriental          0   0   0   0   0   0   0   0   0   0   1   0   0   0   0    0    0
  white             5   2   4   1   1   6   0   1   2   1   2   3   1   4   2    7    0
                 bwt
race              1010 1015 1020 1025 1030 1040 1050 1060 1070 1075 1077 1080 1085 1090
  black              3    1    3    0    4    1    3    3    3    0    1    2    1    1
  native american    1    0    0    0    0    0    0    2    0    0    0    0    0    0
  oriental           0    0    0    0    0    0    0    0    0    0    0    0    0    0
  white              1    0    1    0    2    1    1    2    2    2    0    2    0    2
                 bwt
race              1095 1100 1110 1115 1120 1130 1140 1145 1150 1160 1162 1170 1175 1180
  black              1   11    5    0    6    2    6    0    3    3    1    4    1    7
  native american    0    1    1    0    0    0    0    0    0    0    0    0    0    1
  oriental           0    0    0    0    1    0    0    0    0    1    0    0    0    0
  white              0    8    0    2    5    1    4    1    3    4    0    2    0    4
                 bwt
race              1190 1200 1210 1220 1230 1240 1245 1250 1255 1260 1270 1275 1280 1290
  black              1   11    1    4    4    5    1    4    2    1    1    0    6    5
  native american    0    0    1    1    0    0    0    0    0    0    0    0    0    0
  oriental           0    0    0    0    0    0    0    0    0    0    0    0    0    0
  white              0    8    4    1    8    5    0    7    0    4    3    2    4    4
                 bwt
race              1300 1305 1310 1320 1325 1330 1335 1340 1350 1360 1365 1370 1375 1380
  black              7    0    2    7    1    4    1    4    6    6    1    4    2    1
  native american    0    0    0    0    0    0    0    0    0    0    0    0    0    0
  oriental           0    0    0    0    0    0    0    0    0    1    0    0    0    0
  white              5    1    5    3    0    2    0    5    3    4    0    2    0    3
                 bwt
race              1390 1400 1410 1415 1420 1430 1440 1450 1460 1470 1475 1480 1490 1500
  black              4    6    2    1    6    3    3    4    4    1    1    8    0    9
  native american    0    0    0    0    0    0    0    1    0    0    0    0    0    0
  oriental           0    0    0    0    0    0    0    0    0    0    0    0    0    0
  white              2    4    0    0    6    0    5    6    1    1    0   11    4    5
                 bwt
race              1580
  black              0
  native american    0
  oriental           0
  white              1
twndata=subset(VLBWI, select=c(twn,race))
> table(twndata)
   race
twn black native american oriental white
  0   307              15        4   184
  1    61               1        0    73
-------------------------------------------------------------------------------------------------------------------------------------- 
> twn_sex_data=subset(VLBWI, select=c(twn,sex))
> table(twn_sex_data)
   sex
twn female male
  0    251  263
  1     69   66
------------------------------------------------------------------------------------------------------------------------------------ 
twn_dead_data=subset(VLBWI, select=c(twn,dead))
table(twn_dead_data)
   dead
twn   0   1
  0 417  99
  1 110  25	
--------------------------------------------------------------------------------------------------------------------------------- 
delvery_sex_data=subset(VLBWI, select=c(delivery,sex))
> table(delivery_sex_data)
           sex
delivery    female male
  abdominal    157  155
  vaginal      162  173
------------------------------------------------------------------------------------------------------------------------------- 
delivery_by_twn=prop.table(table(VLBWI$delivery, VLBWI$twn),2)*100
> barplot(delivery_by_twn)
 
bwt_sex_data=subset(VLBWI, select=c(bwt,sex))
> table(bwt_sex_data)
      sex
bwt    female male
  400       2    0
  430       0    1
  460       1    0
  480       1    0
  500       3    1
  510       1    0
  540       1    1
  550       0    0
  560       0    0
  565       0    1
  570       1    1
  575       0    1
  580       0    0
  587       1    0
  590       0    0
  600       3    4
  610       1    2
  620       1    1
  625       0    1
  630       1    0
  640       0    2
  650       1    0
  652       0    2
  660       1    2
  670       4    1
  675       1    1
  680       0    1
  687       0    1
  700       3    1
  710       0    1
  720       3    1
  730       1    1
  740       2    6
  745       0    2
  750       0    2
  760       6    2
  765       2    0
  770       0    3
  780       0    5
  790       1    4
  800       4    7
  805       1    2
  808       1    0
  810       1    0
  820       3    3
  825       1    0
  830       1    2
  835       1    0
  840       2    0
  850       4    3
  860       2    2
  865       0    1
  870       3    1
  875       1    0
  880       5    5
  890       2    0
  900       4    4
  905       2    0
  910       2    2
  920       7    4
  925       1    0
  930       1    1
  940       4    3
  950       3    2
  960       3    0
  970       4    1
  975       0    1
  980       4    5
  990       0    7
  1000      8    9
  1005      0    1
  1010      5    1
  1015      0    1
  1020      0    4
  1025      0    1
  1030      4    2
  1040      2    0
  1050      1    3
  1060      3    4
  1070      1    4
  1075      0    2
  1077      0    1
  1080      1    3
  1085      0    1
  1090      2    1
  1095      0    1
  1100     10   10
  1110      2    4
  1115      1    1
  1120      5    7
  1130      2    1
  1140      5    5
  1145      0    1
  1150      4    2
  1160      2    6
  1162      0    1
  1170      4    2
  1175      1    0
  1180      7    5
  1190      1    0
  1200      9   10
  1210      5    1
  1220      1    5
  1230      7    5
  1240      6    4
  1245      0    1
  1250      7    4
  1255      1    1
  1260      1    4
  1270      1    3
  1275      1    1
  1280      6    4
  1290      4    5
  1300      8    4
  1305      1    0
  1310      3    4
  1320      6    4
  1325      0    1
  1330      2    4
  1335      0    1
  1340      5    4
  1350      2    7
  1360      8    3
  1365      1    0
  1370      4    2
  1375      1    1
  1380      5    0
  1390      2    3
  1400      4    7
  1410      1    1
  1415      0    1
  1420      6    6
  1430      3    0
  1440      4    4
  1450      5    6
  1460      3    3
  1470      1    1
  1475      1    0
  1480      8   11
  1490      2    2
  1500      4   10
  1580      1    0



